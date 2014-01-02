//
//  SMRMath.h
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/24/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMRDataClass.h"

@interface SMRMath : NSObject
+ (double) getPowerFromDecks:(NSInteger) numberOfHeroes hero1:(SMRDeck*) hero1 hero2:(SMRDeck*) hero2 hero3:(SMRDeck*) hero3 hero4:(SMRDeck*) hero4 hero5:(SMRDeck*) hero5 villain:(SMRDeck*) villain environment:(SMRDeck*) environment gameMode:(SMRDeck*) gameMode;

+ (double) getWinRateFromNames:(NSInteger) numberOfHeroes hero1:(NSString*) hero1 hero2:(NSString*) hero2 hero3:(NSString*) hero3 hero4:(NSString*) hero4 hero5:(NSString*) hero5 villain:(NSString*) villain environment:(NSString*) environment;

+ (double) winRate:(double) power;

@end
