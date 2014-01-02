//
//  SMRGameGeneration.h
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/24/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMRDataClass.h"

@interface SMRGameGeneration : NSObject
@end

@interface SMRPregenGame : NSObject
@property NSInteger numberOfPlayers;
@property NSString *hero1;
@property NSString *hero2;
@property NSString *hero3;
@property NSString *hero4;
@property NSString *hero5;
@property NSString *villain;
@property NSString *environment;
+ (id) initNewPregenGame;
- (NSMutableArray*) listHeroDecks:(NSInteger) n;
- (NSMutableArray*) listVillainDecks;
- (NSMutableArray*) listEnvironmentDecks;
- (id) makeGameWithWinRate:(double) min to:(double) max;
- (double) getWinRateFromGame;
- (SMRGame*) generateFullGame;
@end