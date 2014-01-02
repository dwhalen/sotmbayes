//
//  SMRGlobals.h
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/27/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import <Foundation/Foundation.h>

// a class to allow us to pull up global variables.
@interface SMRGlobals : NSObject
// Place any "global" variables here
@property NSMutableArray *villains;
@property NSMutableArray *environments;
@property NSMutableArray *heroes;
@property NSMutableArray *gameModes;
@property NSMutableArray *expansions;
@property NSDictionary *dictionary;
//@property NSInteger gamesPlayed;
@property NSMutableArray *pastGames;
@property BOOL notUploadGameStatistics;
@property BOOL allowDuplicateHeroes;

// message from which our instance is obtained
+ (SMRGlobals *)singleton;
-(void) saveData;
//-(void) loadData;
@end
