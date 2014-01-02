//
//  SMRGameDetailViewController.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/23/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRGameDetailViewController.h"
#import "SMRMath.h"
#import "SMRStyleCellForDeck.h"
#import "SMRUpload.h"

@interface SMRGameDetailViewController ()

@end


/*
 Layout is:
 
 Creation Date
 Victory/Loss dropdown
 Difficulty?
--
 Heroes
--
 Villains
--
 Environment
 */

@implementation SMRGameDetailViewController

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return @"Details";
        case 1: return @"Heroes";
        case 2: return @"Villain";
        case 3: return @"Environment";
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
    //self.navigationController.navigationBar.topItem.title = @"Back";
    

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
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 3;
        case 1:
            return self.game.numberOfPlayers;
        case 2:
            return 1;
        case 3:
            return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0: { // Add three cells, one for each of creation date, victory/loss, difficulty
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameDetailPrototype" forIndexPath:indexPath];
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Played";
                    cell.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:self.game.generatedDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    break;
                case 1: {
                    if ([self.game.won isEqual:@"Win"]) {
                        cell.detailTextLabel.text = @"Victory!";
                        cell.textLabel.text = @"Result (press to toggle)";
                        cell.backgroundColor = [[UIColor alloc] initWithRed:0.8 green:1.0 blue:0.8 alpha:1.0];
                        break;
                    } else if ([self.game.won isEqual:@"Loss"]) {
                        cell.detailTextLabel.text = @"Defeat!";
                        cell.textLabel.text = @"Result (press to toggle)";
                        cell.backgroundColor = [[UIColor alloc] initWithRed:1.0 green:0.8 blue:0.8 alpha:1.0];
                        break;
                    } else if ([self.game.won isEqual:@"Unplayed"]) {
                        cell.detailTextLabel.text = @"Unplayed";
                        cell.textLabel.text = @"Result (press to toggle)";
                        cell.backgroundColor = [[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];;
                        break;
                    }
                    break;
                }
                case 2:
                    cell.textLabel.text = @"Estimated win rate";
                    double difficulty = [self.game getWinRateFromGame];
                    cell.detailTextLabel.text =[NSString stringWithFormat:@"%.0lf%%", 100*difficulty];
                    cell.selectionStyle = 
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    break;
            }
            return cell;
        }
            
        case 1: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GamePrototype" forIndexPath:indexPath];
            switch (indexPath.row) {
                case 0: [SMRStyleCellForDeck styleForDeckCellByName:cell name:self.game.hero1]; break;
                case 1: [SMRStyleCellForDeck styleForDeckCellByName:cell name:self.game.hero2]; break;
                case 2: [SMRStyleCellForDeck styleForDeckCellByName:cell name:self.game.hero3]; break;
                case 3: [SMRStyleCellForDeck styleForDeckCellByName:cell name:self.game.hero4]; break;
                case 4: [SMRStyleCellForDeck styleForDeckCellByName:cell name:self.game.hero5]; break;
            }
            return cell;
  
        }
        case 2: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GamePrototype" forIndexPath:indexPath];
            [SMRStyleCellForDeck styleForDeckCellByName:cell name:self.game.villain];
            return cell;
        }
        case 3: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GamePrototype" forIndexPath:indexPath];
            [SMRStyleCellForDeck styleForDeckCellByName:cell name:self.game.environment];
            return cell;
        }
            
        default: { // this should never happen
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GamePrototype" forIndexPath:indexPath];
            return cell; break;
        }
            
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0 && indexPath.row == 1) {
        //This is the only selectable row.  If it's selected, we should toggle the win condition and reload the cell.
        if ([self.game.won isEqual:@"Win"]) {
            [self.game setVictory:@"Loss"];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        } else if ([self.game.won isEqual:@"Loss"]) {
            [self.game setVictory:@"Unplayed"];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        } else if ([self.game.won isEqual:@"Unplayed"]) {
            [self.game setVictory:@"Win"];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
        [SMRUpload upload];
        //[[SMRGlobals singleton] saveData];

    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
