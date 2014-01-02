//
//  SMRStyleCellForDeck.h
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/25/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMRDataClass.h"
#import "SMRExpansion.h"

@interface SMRStyleCellForDeck : NSObject
//+ (void) styleForDeckCell:(UITableViewCell*) cell deck: (SMRDeck*) deck;
+ (void) styleForRandomCell:(UITableViewCell*) cell;
+ (void) styleForDeckCellByName:(UITableViewCell*) cell name:(NSString*) name;
+ (void) styleForGameCellByName:(UITableViewCell*) cell name:(SMRGame*) game;
+ (void) styleForExpansionCellByExpansion:(UITableViewCell*) cell name:(SMRExpansion*) expansion;
@end
