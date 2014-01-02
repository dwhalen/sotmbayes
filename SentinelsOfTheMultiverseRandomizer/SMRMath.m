//
//  SMRMath.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/24/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRMath.h"
#import "SMRDataClass.h"

@implementation SMRMath
+ (double) getPowerFromDecks:(NSInteger) numberOfHeroes hero1:(SMRDeck*) hero1 hero2:(SMRDeck*) hero2 hero3:(SMRDeck*) hero3 hero4:(SMRDeck*) hero4 hero5:(SMRDeck*) hero5 villain:(SMRDeck*) villain environment:(SMRDeck*) environment gameMode:(SMRDeck*) gameMode {
    double power = 0;
    switch (numberOfHeroes) {
        case 3:
            power += [hero1.score3 doubleValue];
            power += [hero2.score3 doubleValue];
            power += [hero3.score3 doubleValue];
            power += [villain.score3 doubleValue];
            power += [environment.score3 doubleValue];
            power += [gameMode.score3 doubleValue];
            break;
        case 4:
            power += [hero1.score4 doubleValue];
            power += [hero2.score4 doubleValue];
            power += [hero3.score4 doubleValue];
            power += [hero4.score4 doubleValue];
            power += [villain.score4 doubleValue];
            power += [environment.score4 doubleValue];
            power += [gameMode.score4 doubleValue];
            break;
        case 5:
            power += [hero1.score5 doubleValue];
            power += [hero2.score5 doubleValue];
            power += [hero3.score5 doubleValue];
            power += [hero4.score5 doubleValue];
            power += [hero5.score5 doubleValue];
            power += [villain.score5 doubleValue];
            power += [environment.score5 doubleValue];
            power += [gameMode.score5 doubleValue];
        break;
    }

    return power; // Win rate
}

+ (double) getWinRateFromNames:(NSInteger) numberOfHeroes hero1:(NSString*) hero1 hero2:(NSString*) hero2 hero3:(NSString*) hero3 hero4:(NSString*) hero4 hero5:(NSString*) hero5 villain:(NSString*) villain environment:(NSString*) environment {
    
    // I assume that gamemode always is base
    NSDictionary *dictionary = [SMRGlobals singleton].dictionary;
    
    return [SMRMath winRate:[SMRMath getPowerFromDecks:numberOfHeroes hero1:(SMRDeck*)dictionary[hero1] hero2:dictionary[hero2] hero3:dictionary[hero3] hero4:dictionary[hero4] hero5:dictionary[hero5] villain:dictionary[villain] environment:dictionary[environment] gameMode:dictionary[@"base"]]];
}

+ (double) winRate:(double) power {
    return exp(power/100)/(1+exp(power/100));
}



@end
