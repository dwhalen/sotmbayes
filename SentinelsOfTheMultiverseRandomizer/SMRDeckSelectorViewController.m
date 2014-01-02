//
//  SMRDeckSelectorViewController.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/26/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRDeckSelectorViewController.h"
#import "SMRStyleCellForDeck.h"
#import "SMRGenerateGameViewController.h"

@interface SMRDeckSelectorViewController ()

@end

@implementation SMRDeckSelectorViewController

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
    
    self.navigationController.title = self.title;
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return self.deckNames.count;
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeckSelectorPrototype" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        [SMRStyleCellForDeck styleForRandomCell:cell];
        if ([self.target isEqualToString:@"Random"]) {cell.accessoryType = UITableViewCellAccessoryCheckmark;}
    }
    if (indexPath.section == 1) {
        [SMRStyleCellForDeck styleForDeckCellByName:cell name:[self.deckNames objectAtIndex:indexPath.row]];
        if ([self.target isEqualToString:[self.deckNames objectAtIndex:indexPath.row]]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *arrayViewControllers = [self.navigationController viewControllers];
    SMRGenerateGameViewController *parent = (SMRGenerateGameViewController *)[arrayViewControllers objectAtIndex:arrayViewControllers.count-2];
    
    NSString *returnValue;
    if (indexPath.section == 0) {returnValue = @"Random";}
    if (indexPath.section == 1) {returnValue = [self.deckNames objectAtIndex:indexPath.row];}

    if ([self.title isEqualToString:@"Hero 1"]) {parent.game.hero1 = returnValue;}
    if ([self.title isEqualToString:@"Hero 2"]) {parent.game.hero2 = returnValue;}
    if ([self.title isEqualToString:@"Hero 3"]) {parent.game.hero3 = returnValue;}
    if ([self.title isEqualToString:@"Hero 4"]) {parent.game.hero4 = returnValue;}
    if ([self.title isEqualToString:@"Hero 5"]) {parent.game.hero5 = returnValue;}
    if ([self.title isEqualToString:@"Villain"]) {parent.game.villain = returnValue;}
    if ([self.title isEqualToString:@"Environment"]) {parent.game.environment = returnValue;}
  
    // Now transition back.
    [self.navigationController popViewControllerAnimated:YES];
}

@end
