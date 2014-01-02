//
//  SMRExpansionAvailabilityViewController.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/22/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRExpansionAvailabilityViewController.h"
#import "SMRDataClass.h"
#import "SMRExpansion.h"
#import "SMRExpansionExpandToDecksViewController.h"
#import "SMRStyleCellForDeck.h"

@interface SMRExpansionAvailabilityViewController ()

@end

@implementation SMRExpansionAvailabilityViewController

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {return 60;}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return @"Expansions (press to expand)";
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


- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[SMRGlobals singleton].expansions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DecksAvailablePrototype" forIndexPath:indexPath];
    SMRExpansion *expansion = [[SMRGlobals singleton].expansions objectAtIndex:indexPath.row];
    [SMRStyleCellForDeck styleForExpansionCellByExpansion:cell name:expansion];
    
    NSString *currentstate = [expansion getAvailability]; //returns YES, NO, PARTIAL, or EMPTY
    
    if ([currentstate  isEqual: @"YES"]) {
        // Display a thing in the on position with the normal coloring
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
        //[switchView setOnTintColor:[UIColor yellowColor]];
        cell.accessoryView = switchView;
        switchView.tag = indexPath.row;
        [switchView setOn:YES animated:NO];
        [switchView addTarget:self action:@selector(expansionAllowedSwitchFlipped:) forControlEvents:UIControlEventValueChanged];
    } else if ([currentstate isEqual: @"NO"]) {
        // Display a thing in the off position with the normal coloring
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
        //[switchView setOnTintColor:[UIColor yellowColor]];
        cell.accessoryView = switchView;
        switchView.tag = indexPath.row;
        [switchView setOn:NO animated:NO];
        [switchView addTarget:self action:@selector(expansionAllowedSwitchFlipped:) forControlEvents:UIControlEventValueChanged];
    } else if ([currentstate isEqualToString:@"PARTIAL"]) {
        // Display a thing in the on position with the normal coloring
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
        [switchView setOnTintColor:[UIColor yellowColor]];
        cell.accessoryView = switchView;
        switchView.tag = indexPath.row;
        [switchView setOn:YES animated:NO];
        [switchView addTarget:self action:@selector(expansionAllowedSwitchFlipped:) forControlEvents:UIControlEventValueChanged];
    } else {
        // Do not create a switch.  There is nothing to display, after all.
        NSLog(@"Found empty expansion");
    }
    
    return cell;
}

- (void) expansionAllowedSwitchFlipped:(id)sender {
    // Load the switch
    UISwitch* switchView = sender;
    
    // Use the tag to determine what expansion we were talking about.
    SMRExpansion *expansion = [[SMRGlobals singleton].expansions objectAtIndex:switchView.tag];
    
    // Set the color back to the default.  We first create a new cell to test what the default color is.  There has to be a better way.
    UISwitch *tempswitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [switchView setOnTintColor:tempswitch.onTintColor];
    
    // Set the availability of all the decks owned by the expansion
    [expansion setAvailability:switchView.on];
    
    // Save our new data
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


#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
    SMRExpansionExpandToDecksViewController *detailController = segue.destinationViewController;
    SMRExpansion *expansion = [[SMRGlobals singleton].expansions objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    [detailController setExpansion:expansion];
 }


@end
