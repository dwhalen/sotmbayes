//
//  SMRDifficultySelectorViewController.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/25/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRDifficultySelectorViewController.h"
#import "SMRGenerateGameViewController.h"

@interface SMRDifficultySelectorViewController ()

@end

@implementation SMRDifficultySelectorViewController

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //SMRGenerateGameViewController *parent = (SMRGenerateGameViewController*)self.navigationController.navigationController;
    
    // THIS IS NOT THE BEST WAY TO IMPLEMENT THIS.  I SHOULD USE DELEGATES INSTEAD.
    // Get array of current navigation stack
    NSArray *arrayViewControllers = [self.navigationController viewControllers];
    SMRGenerateGameViewController *parent = (SMRGenerateGameViewController *)[arrayViewControllers objectAtIndex:arrayViewControllers.count-2];

    return parent.difficulties.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // THIS IS NOT THE BEST WAY TO IMPLEMENT THIS.  I SHOULD USE DELEGATES INSTEAD.
    // Get array of current navigation stack
    NSArray *arrayViewControllers = [self.navigationController viewControllers];
    SMRGenerateGameViewController *parent = (SMRGenerateGameViewController *)[arrayViewControllers objectAtIndex:arrayViewControllers.count-2];
    
    SMRDifficulties* difficulties = parent.difficulties;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DifficultyPrototype" forIndexPath:indexPath];
    cell.textLabel.text = [difficulties.names objectAtIndex:indexPath.row];
    if (indexPath.row == parent.currentdifficulty) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    // Configure the cell...
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Do the following things: remove the checkbox from the old cell.  Add the checkbox to the new cell.  Refresh the views of both cells.  Transition back to the previous page.
    NSArray *arrayViewControllers = [self.navigationController viewControllers];
    SMRGenerateGameViewController *parent = (SMRGenerateGameViewController *)[arrayViewControllers objectAtIndex:arrayViewControllers.count-2];
 
    parent.currentdifficulty = indexPath.row;
    //[self.tableView reloadData];
    
    // Now transition back.
    [self.navigationController popViewControllerAnimated:YES];
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
