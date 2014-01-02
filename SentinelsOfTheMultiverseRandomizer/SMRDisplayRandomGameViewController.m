//
//  SMRDisplayRandomGameViewController.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/26/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRDisplayRandomGameViewController.h"
#import "SMRStyleCellForDeck.h"
#import "SMRGenerateGameViewController.h"
#import "SMRDataClass.h"
#import "SMRUpload.h"

@interface SMRDisplayRandomGameViewController ()

@end

@implementation SMRDisplayRandomGameViewController

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {return .0001;}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.errorMessage) {return nil;}
    switch (section) {
        case 0: return nil;
        case 1: return @"Details";
        case 2: return @"Heroes";
        case 3: return @"Villain";
        case 4: return @"Environment";
    }
    return nil;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.errorMessage) {return 1;}
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.errorMessage) {return 1;}
    switch (section) {
        case 0: return 4;
        case 1: return 1;
        case 2: return self.game.numberOfPlayers;
        case 3: return 1;
        case 4: return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.errorMessage) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailPrototype" forIndexPath:indexPath];
        cell.textLabel.text = @"Insufficiently many available decks.";
        cell.detailTextLabel.text = @"";
    }

    switch (indexPath.section) {
        
        // BUTTONS
        case 0: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GenerateButtonPrototype" forIndexPath:indexPath];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Discard and generate new game";
                    cell.backgroundColor = [UIColor colorWithRed:.8 green:.8 blue:1 alpha:1];
                    break;
                case 1:
                    cell.textLabel.text = @"Save game as Victory!";
                    cell.backgroundColor = [UIColor colorWithRed:.8 green:1 blue:.8 alpha:1];
                    break;
                case 2:
                    cell.textLabel.text = @"Save game as Defeat!";
                    cell.backgroundColor = [UIColor colorWithRed:1 green:.8 blue:.8 alpha:1];
                    break;
                case 3:
                    cell.textLabel.text = @"Save game for later";
                    cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
                    break;
            }
            return cell;
        }
            
        // DETAIL CELL.  ALL ONE OF THEM.
        case 1: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailPrototype" forIndexPath:indexPath];
            cell.textLabel.text = @"Estimated win rate";
            double difficulty = [self.game getWinRateFromGame];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.0lf%%", 100*difficulty];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            break;
        }
        
        // HEROES
        case 2: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeckPrototype" forIndexPath:indexPath];
            NSString *name;
            switch (indexPath.row) {
                case 0: name = self.game.hero1; break;
                case 1: name = self.game.hero2; break;
                case 2: name = self.game.hero3; break;
                case 3: name = self.game.hero4; break;
                case 4: name = self.game.hero5; break;
            }
            [SMRStyleCellForDeck styleForDeckCellByName:cell name:name];
            return cell;
        }
        
        // VILLAIN
        case 3: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeckPrototype" forIndexPath:indexPath];
            [SMRStyleCellForDeck styleForDeckCellByName:cell name:self.game.villain];
            return cell;
        }
        // ENVIRONMENT
        case 4: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeckPrototype" forIndexPath:indexPath];
            [SMRStyleCellForDeck styleForDeckCellByName:cell name:self.game.environment];
            return cell;
        }
    }
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeckPrototype" forIndexPath:indexPath]; return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.errorMessage) {return;}
    if (indexPath.section != 0) {return;}
    
    if (indexPath.row == 0) {
        // Get the parent and then call GenerateGameButton on it.
        NSArray *arrayViewControllers = [self.navigationController viewControllers];
        SMRGenerateGameViewController *parent = (SMRGenerateGameViewController *)[arrayViewControllers objectAtIndex:arrayViewControllers.count-2];
        [parent GenerateGameButton:self];
        [self.tableView reloadData];
        return;
    }

    // Otherwise, we are going to save the game, so we should create it and then set it to won as appropriate.
    
    //Check to see whether a game with the current ID alreay exists.  If so we want to overwrite that.  Otherwise, we add a new game to the array.
    NSMutableArray *pastGames = [SMRGlobals singleton].pastGames;
    SMRGame *newGame = nil;
    for (NSInteger i = 1; i<pastGames.count; i++) {
        SMRGame *pastGame= [pastGames objectAtIndex:i];
        if (pastGame.GameID == self.game.GameID) {newGame = pastGame; break;}
    }
    if (newGame == nil) {
        [pastGames addObject:self.game];
        newGame = [pastGames objectAtIndex:(pastGames.count-1)];
    }
    
    // We've found the game.  Now mark it as won or unwon as appropriate.
    switch (indexPath.row) {
        case 1: [newGame setVictory:@"Win"]; break;
        case 2: [newGame setVictory:@"Loss"]; break;
        case 3: [newGame setVictory:@"Unplayed"]; break;
    }
    [SMRUpload upload];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
