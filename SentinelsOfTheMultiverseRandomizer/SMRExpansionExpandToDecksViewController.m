//
//  SMRExpansionExpandToDecksViewController.m
//  ScaryBugs
//
//  Created by Daniel Whalen on 12/23/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRExpansionExpandToDecksViewController.h"
#import "SMRDataClass.h"
#import "SMRStyleCellForDeck.h"

@interface SMRExpansionExpandToDecksViewController ()
@end

@implementation SMRExpansionExpandToDecksViewController

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return @"Heroes";
        case 1: return @"Villains";
        case 2: return @"Environments";
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
    self.navigationItem.title = self.expansion.name;
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
    // Return one section for each of heroes, villains, and environments
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SMRExpansion *expansion = self.expansion;
    switch (section) {
        case 0:
            return [expansion heroes].count;
            break;
        case 1:
            return [expansion villains].count;
            break;
        case 2:
            return [expansion environments].count;
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExpansionDetailsPrototype" forIndexPath:indexPath];
    SMRExpansion *expansion = self.expansion;
    SMRDeck *deck;
    
    
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
    
    cell.accessoryView = switchView;
    switchView.tag = indexPath.row;
    [switchView setOn:deck.available animated:NO];
    
    NSDictionary *dictionary = [[SMRGlobals singleton] dictionary];
    switch (indexPath.section) {
        case 0: {
            deck =  dictionary[[[expansion heroes] objectAtIndex:indexPath.row]];
            [switchView addTarget:self action:@selector(heroFlipped:) forControlEvents:UIControlEventValueChanged];
            break;}
        case 1: {
            deck =  dictionary[[[expansion villains] objectAtIndex:indexPath.row]];
            [switchView addTarget:self action:@selector(villainFlipped:) forControlEvents:UIControlEventValueChanged];
            break;}
        case 2: {
            deck =  dictionary[[[expansion environments] objectAtIndex:indexPath.row]];
            [switchView addTarget:self action:@selector(environmentFlipped:) forControlEvents:UIControlEventValueChanged];
            break;}
    }
    [SMRStyleCellForDeck styleForDeckCellByName:cell name:deck.name];

    [switchView setOn:deck.available animated:NO];
    return cell;
}

- (void) heroFlipped:(id)sender {
    // Load the switch
    UISwitch* switchView = sender;
    
    NSDictionary *dictionary = [[SMRGlobals singleton] dictionary];
    SMRDeck *deck = dictionary[[self.expansion.heroes objectAtIndex:switchView.tag]];
    
    // Set the availability of all the decks owned by the expansion
    deck.available = switchView.on;
    [[SMRGlobals singleton] saveData];

}
- (void) villainFlipped:(id)sender {
    // Load the switch
    UISwitch* switchView = sender;
    
    NSDictionary *dictionary = [[SMRGlobals singleton] dictionary];
    SMRDeck *deck = dictionary[[self.expansion.villains objectAtIndex:switchView.tag]];
    
    // Set the availability of all the decks owned by the expansion
    deck.available = switchView.on;
    [[SMRGlobals singleton] saveData];

}
- (void) environmentFlipped:(id)sender {
    // Load the switch
    UISwitch* switchView = sender;
    
    NSDictionary *dictionary = [[SMRGlobals singleton] dictionary];
    SMRDeck *deck = dictionary[[self.expansion.environments objectAtIndex:switchView.tag]];
    
    // Set the availability of all the decks owned by the expansion
    deck.available = switchView.on;
    [[SMRGlobals singleton] saveData];

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
