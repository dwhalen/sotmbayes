//
//  SMRInitialize.h
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/22/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMRInitialize : NSObject
+ (void)initializeSMR;
//+ (void)initializeFakeGameHistory;
+ (NSDictionary *) createDictionary:(NSDictionary*) oldDictionary decks:(NSMutableArray *)decks;
@end