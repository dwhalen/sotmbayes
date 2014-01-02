//
//  SMRGenerateGameViewController.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/24/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRGenerateGameViewController.h"
#import "SMRDataClass.h"
#import "SMRStyleCellForDeck.h"
#import "SMRDeckSelectorViewController.h"
#import "SMRDisplayRandomGameViewController.h"

@implementation SMRDifficulties


@end


@interface SMRGenerateGameViewController ()

@end

@implementation SMRGenerateGameViewController


//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
//    /* Create custom view to display section header... */
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
//    [label setFont:[UIFont boldSystemFontOfSize:12]];
//    NSString *string =[@[@"test",@"sec2",@"@sec3",@"sagsfa",@"rewtaewTAWETAW"] objectAtIndex:section];
//    /* Section header is in 0th index... */
//    [label setText:string];
//    [view addSubview:label];
////    [view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
//    return view;
//}

-(void) stepperValueDidChange:(UIStepper *) stepper {
    NSInteger oldValue = self.game.numberOfPlayers;
    NSInteger newValue = stepper.value;
    
    self.game.numberOfPlayers = newValue;
    
    NSIndexPath *modifiedRow = [NSIndexPath indexPathForRow:(newValue-1) inSection:2];
    if (newValue == oldValue+1) {
        [self.tableView insertRowsAtIndexPaths:@[modifiedRow] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    if (newValue == oldValue-1) {
        [self.tableView deleteRowsAtIndexPaths:@[modifiedRow] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    [self.tableView reloadData];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {return 0;}
    return 40.;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {return [[UIView alloc] initWithFrame:CGRectZero];}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {return .0001;}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] init];
    if (section == 0) {return nil;}
    
    if (section == 2) { // Add a stepper.  Those are exciting.
        UIStepper *stepper=[[UIStepper alloc] initWithFrame:CGRectMake(tableView.frame.size.width-100,5,tableView.frame.size.width,tableView.frame.size.height-5)];
        //stepper.transform = CGAffineTransformMakeScale(.5, .5);
        stepper.minimumValue = 3;
        stepper.maximumValue = 5;
        stepper.value = self.game.numberOfPlayers;
        [stepper addTarget:self action:@selector(stepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
        [headerView addSubview:stepper];
    }
    switch (section) {
        case 1: headerView.textLabel.text = @"Target difficulty"; break;
        case 2: headerView.textLabel.text = @"Heroes"; break;
        case 3: headerView.textLabel.text = @"Villains"; break;
        case 4: headerView.textLabel.text = @"Environment"; break;

    }
    
    return headerView;
}

- (void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
// return @"blah";
//}

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
    self.game = [SMRPregenGame initNewPregenGame];
    
    SMRDifficulties *difficulties = [[SMRDifficulties alloc] init];
    self.difficulties = difficulties;
                        
    self.difficulties.names = @[@"35%: Insane",@"45%: Very Hard",@"55% Harder",@"65%: Hard",@"75%: Normal",@"85%: Easy",@"95%: Trivial"];
    self.difficulties.minpowers = @[@.3,@.4,@.5,@.6,@.7,@.8,@.9];
    self.difficulties.maxpowers = @[@.4,@.5,@.6,@.7,@.8,@.9,@1];
    self.currentdifficulty = 4;
    
    //NSLog(@"Initialized Difficulty Settings");

    // Initialize the game
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case 0: return 1;
        case 1: return 1;
        case 2: return self.game.numberOfPlayers;
        case 3: return 1;
        case 4: return 1;
        default: NSLog(@"invalid section number"); return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
            
        // GENERATE GAME BUTTON
        case 0: {
            
            if ([self isGamePossible]) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GenerateButtonProtoype" forIndexPath:indexPath];
                cell.textLabel.textAlignment = NSTextAlignmentCenter;
                cell.textLabel.text = @"Press to Generate Game";
                cell.backgroundColor = [UIColor colorWithRed:.8 green:.8 blue:1 alpha:1];
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ErrorPrototype" forIndexPath:indexPath];
                cell.textLabel.textAlignment = NSTextAlignmentCenter;
                cell.textLabel.text = @"Error: too few decks for game";
                cell.backgroundColor = [UIColor colorWithRed:1 green:.8 blue:.8 alpha:1];
                return cell;

            }
            
            break;
        }
            
        // DIFFICULTY
        case 1: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DifficultySelectorPrototype" forIndexPath:indexPath];
            NSString *text = [self.difficulties.names objectAtIndex:self.currentdifficulty];
            cell.textLabel.text = text;
            return cell;
            break;
        }
            
        // HEROES
        case 2: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeckSelectorPrototype" forIndexPath:indexPath];
            NSString *deckName;
            switch (indexPath.row) {
                case 0: {deckName = self.game.hero1; break;}
                case 1: {deckName = self.game.hero2; break;}
                case 2: {deckName = self.game.hero3; break;}
                case 3: {deckName = self.game.hero4; break;}
                case 4: {deckName = self.game.hero5; break;}
            }
            if ([deckName isEqualToString:@"Random"]) {
                //display the cell corresponding to a random element
                [SMRStyleCellForDeck styleForRandomCell:cell];
            } else {
                //display the cell for the hero
                //SMRDeck *deck = dictionary[deckName];
                [SMRStyleCellForDeck styleForDeckCellByName:cell name:deckName];
            }
            return cell;
            break;
        }
        
        // VILLAIN
        case 3: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeckSelectorPrototype" forIndexPath:indexPath];
            NSString *deckName;
            deckName = self.game.villain;
            if ([deckName isEqualToString:@"Random"]) {
                //display the cell corresponding to a random element
                [SMRStyleCellForDeck styleForRandomCell:cell];
            } else {
                //display the cell for the hero
                //SMRDeck *deck = dictionary[deckName];
                [SMRStyleCellForDeck styleForDeckCellByName:cell name:deckName];
            }
            return cell;
            break;
        }
        
        // ENVIRONMENT
        case 4: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeckSelectorPrototype" forIndexPath:indexPath];
            NSString *deckName;
            deckName = self.game.environment;
            if ([deckName isEqualToString:@"Random"]) {
                //display the cell corresponding to a random element
                [SMRStyleCellForDeck styleForRandomCell:cell];
            } else {
                //display the cell for the hero
                //SMRDeck *deck = dictionary[deckName];
                [SMRStyleCellForDeck styleForDeckCellByName:cell name:deckName];
            }
            return cell;
            break;
        }
            
        default: {UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeckSelectorPrototype" forIndexPath:indexPath]; return cell;}
            
    }
}

#pragma mark - Navigation

//In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
     NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if (indexPath.section == 1) {return;}

    if (indexPath.section == 0) {
        SMRDisplayRandomGameViewController *destination = [segue destinationViewController];
        [self GenerateGameButton:destination];
        return;
    }

    
    SMRDeckSelectorViewController *destination = [segue destinationViewController];
    if (indexPath.section == 2 && indexPath.row == 0) {destination.target = self.game.hero1;destination.deckNames = [self.game listHeroDecks:0];destination.title = @"Hero 1";}
    if (indexPath.section == 2 && indexPath.row == 1) {destination.target = self.game.hero2;destination.deckNames = [self.game listHeroDecks:1];destination.title = @"Hero 2";}
    if (indexPath.section == 2 && indexPath.row == 2) {destination.target = self.game.hero3;destination.deckNames = [self.game listHeroDecks:2];destination.title = @"Hero 3";}
    if (indexPath.section == 2 && indexPath.row == 3) {destination.target = self.game.hero4;destination.deckNames = [self.game listHeroDecks:3];destination.title = @"Hero 4";}
    if (indexPath.section == 2 && indexPath.row == 4) {destination.target = self.game.hero5;destination.deckNames = [self.game listHeroDecks:4];destination.title = @"Hero 5";}
    if (indexPath.section == 3) {destination.target = self.game.villain;destination.deckNames = [self.game listVillainDecks];destination.title = @"Villain";}
    if (indexPath.section == 4) {destination.target = self.game.environment;destination.deckNames = [self.game listEnvironmentDecks];destination.title = @"Environment";}
    return;
}







// PAST HERE IS CODE TO INTERFACE WITH THE RANDOM GAME GENERATOR

- (void) GenerateGameButton:(SMRDisplayRandomGameViewController*) destination {
    //There are a bunch of things we need to check.  First, that there are enough decks to generate a game.

    double minpower = (double) [(NSNumber*) [(NSArray*) self.difficulties.minpowers objectAtIndex:self.currentdifficulty] doubleValue];
    double maxpower = (double) [(NSNumber*) [(NSArray*) self.difficulties.maxpowers objectAtIndex:self.currentdifficulty] doubleValue];

    SMRPregenGame *randomGame = [self.game makeGameWithWinRate:minpower to:maxpower];
    SMRGame *postgenGame = [randomGame generateFullGame];
    
    destination.game = postgenGame;
    
}

- (BOOL) isGamePossible {
    SMRGlobals *globals = [SMRGlobals singleton];
    BOOL possible = YES;
    if ([SMRGenerateGameViewController countNumberOfUniqueDecks:globals.environments] < 1) {possible=NO;}
    if ([SMRGenerateGameViewController countNumberOfUniqueDecks:globals.villains] < 1) {possible=NO;}
    if (globals.allowDuplicateHeroes && ([SMRGenerateGameViewController countNumberOfUniqueNames:globals.heroes] < (self.game.numberOfPlayers))) {possible=NO;}
    if ((!globals.allowDuplicateHeroes) && ([SMRGenerateGameViewController countNumberOfUniqueDecks:globals.heroes] < (self.game.numberOfPlayers))) {possible=NO;}
    return possible;
}

+ (NSInteger) countNumberOfUniqueDecks:(NSArray*) deckList {
    NSMutableArray *currentDecks = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<deckList.count; i++) {
        SMRDeck *deck = [deckList objectAtIndex:i];
        NSString *name = deck.deck;
        if (deck.available && ![currentDecks containsObject:name]) {
            [currentDecks addObject:name];
        }
    }
    return currentDecks.count;
}
+ (NSInteger) countNumberOfUniqueNames:(NSArray*) deckList {
    NSMutableArray *currentDecks = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<deckList.count; i++) {
        SMRDeck *deck = [deckList objectAtIndex:i];
        NSString *name = deck.name;
        if (deck.available && ![currentDecks containsObject:name]) {
            [currentDecks addObject:name];
        }
    }
    return currentDecks.count;
}
        
@end
