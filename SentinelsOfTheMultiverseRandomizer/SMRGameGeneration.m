//
//  SMRGameGeneration.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/24/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRGameGeneration.h"
#import "SMRDataClass.h"
#import "SMRMath.h"


@implementation SMRGameGeneration

@end

@implementation SMRPregenGame

- (SMRGame*) generateFullGame {
    return [[SMRGame alloc] initGameWithPlayers:self.numberOfPlayers villain:self.villain environment:self.environment hero1:self.hero1 hero2:self.hero2 hero3:self.hero3 hero4: self.hero4 hero5:self.hero5];
}

- (double) getWinRateFromGame {
    return [SMRMath getWinRateFromNames:self.numberOfPlayers hero1:self.hero1 hero2:self.hero2 hero3:self.hero3 hero4:self.hero4 hero5:self.hero5 villain:self.villain environment:self.environment];
}

- (id) copy {
    SMRPregenGame *newGame = [[SMRPregenGame alloc] init];
    newGame.numberOfPlayers = self.numberOfPlayers;
    newGame.hero1 = [self.hero1 copy];
    newGame.hero2 = [self.hero2 copy];
    newGame.hero3 = [self.hero3 copy];
    newGame.hero4 = [self.hero4 copy];
    newGame.hero5 = [self.hero5 copy];
    newGame.villain = [self.villain copy];
    newGame.environment = [self.environment copy];
    return newGame;
}

- (id) makeGameWithWinRate:(double) minRate to:(double) maxRate {
    
    // We generate a metric fuckton of games at complete random.  If any of them work, we return it.
    
    SMRPregenGame *trialGame = [self copy];
    [trialGame completeGame];
    double winRate = [SMRMath getWinRateFromNames:trialGame.numberOfPlayers hero1:trialGame.hero1 hero2:trialGame.hero2 hero3:trialGame.hero3 hero4:trialGame.hero4 hero5:trialGame.hero5 villain:trialGame.villain environment:trialGame.environment];
    if (minRate < winRate && winRate < maxRate) {return trialGame;}
    double distance;
    if (winRate < maxRate) {distance = minRate - winRate;} else {distance = winRate - maxRate;}
    
    SMRPregenGame *bestMatch = trialGame;
    double bestDistance = distance;
    
    for (NSInteger i = 1; i <= 1000; i++) {
        trialGame = [self copy];
        [trialGame completeGame];
        double winRate = [SMRMath getWinRateFromNames:trialGame.numberOfPlayers hero1:trialGame.hero1 hero2:trialGame.hero2 hero3:trialGame.hero3 hero4:trialGame.hero4 hero5:trialGame.hero5 villain:trialGame.villain environment:trialGame.environment];
        if (minRate < winRate && winRate < maxRate) {return trialGame;}
        double distance;
        if (winRate < maxRate) {distance = minRate - winRate;} else {distance = winRate - maxRate;}
        
        
        if (distance<bestDistance) {
            bestMatch = trialGame;
            bestDistance = distance;
        }
    }
    
    return bestMatch;
}

- (void) completeGame {
    if ([self.hero1 isEqualToString:@"Random"]) {
        NSArray *possibleDecks = [self listHeroDecks:0];
        self.hero1 = [[possibleDecks objectAtIndex:(arc4random_uniform([possibleDecks count]))] copy];
    }
    if ([self.hero2 isEqualToString:@"Random"]) {
        NSArray *possibleDecks = [self listHeroDecks:1];
        self.hero2 = [[possibleDecks objectAtIndex:(arc4random_uniform([possibleDecks count]))] copy];
    }
    if ([self.hero3 isEqualToString:@"Random"]) {
        NSArray *possibleDecks = [self listHeroDecks:2];
        self.hero3 = [[possibleDecks objectAtIndex:(arc4random_uniform([possibleDecks count]))] copy];
    }
    if (self.numberOfPlayers>=4 && [self.hero4 isEqualToString:@"Random"]) {
        NSArray *possibleDecks = [self listHeroDecks:3];
        self.hero4 = [[possibleDecks objectAtIndex:(arc4random_uniform([possibleDecks count]))] copy];
    }
    if (self.numberOfPlayers>=5  && [self.hero5 isEqualToString:@"Random"]) {
        NSArray *possibleDecks = [self listHeroDecks:4];
        self.hero5 = [[possibleDecks objectAtIndex:(arc4random_uniform([possibleDecks count]))] copy];
    }
    if ([self.environment isEqualToString:@"Random"]) {
        NSArray *possibleDecks = [self listEnvironmentDecks];
        self.environment = [[possibleDecks objectAtIndex:(arc4random_uniform([possibleDecks count]))] copy];
    }
    if ([self.villain isEqualToString:@"Random"]) {
        NSArray *possibleDecks = [self listVillainDecks];
        self.villain = [[possibleDecks objectAtIndex:(arc4random_uniform([possibleDecks count]))] copy];
    }
    return;
}

+ (id) initNewPregenGame {
    SMRPregenGame *pregenGame = [SMRPregenGame alloc];
    pregenGame.numberOfPlayers = 3;
    pregenGame.hero1 = @"Random";
    pregenGame.hero2 = @"Random";
    pregenGame.hero3 = @"Random";
    pregenGame.hero4 = @"Random";
    pregenGame.hero5 = @"Random";
    pregenGame.villain = @"Random";
    pregenGame.environment = @"Random";
    
    return pregenGame;
}

- (SMRGame*) generateGame {
    // This is test data so that I don't have to implement this quite yet.
    SMRGame *game1 = [[SMRGame alloc] initGameWithPlayers:3 villain:@"v1" environment:@"e2" hero1:@"h1" hero2:@"h2" hero3:@"h3" hero4:nil hero5:nil];
    return game1;
}

- (NSMutableArray*) listVillainDecks {
    NSMutableArray* decks = [SMRGlobals singleton].villains;
    
    NSMutableArray *stringArray = [[NSMutableArray alloc] init];
    
    for(int i=0; i< [decks count]; i++){
        SMRDeck *deck = [decks objectAtIndex:i];
        if (deck.available) {
            [stringArray addObject:deck.name];
        }
    }
    
    [stringArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return stringArray;
}

- (NSMutableArray*) listEnvironmentDecks {
    NSMutableArray* decks = [SMRGlobals singleton].environments;
    
    NSMutableArray *stringArray = [[NSMutableArray alloc] init];
    
    for(int i=0; i< [decks count]; i++){
        SMRDeck *deck = [decks objectAtIndex:i];
        if (deck.available) {
            [stringArray addObject:deck.name];
        }
    }
    
    [stringArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return stringArray;
}

- (NSMutableArray*) listHeroDecks:(NSInteger) n {  // n is between 0 and 4
    NSMutableArray* decks = [SMRGlobals singleton].heroes;
    
    NSMutableArray *stringArray = [[NSMutableArray alloc] init];
    
    if ([SMRGlobals singleton].allowDuplicateHeroes) {
        for(int i=0; i< [decks count]; i++){
            SMRDeck *deck = [decks objectAtIndex:i];
            if (deck.available) {
                [stringArray addObject:deck.name];
            }
        }
        [stringArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        return stringArray;// Sort all the heroes.  Should we sort by deck, or by expansion?  I'll think about this.
    } else {
    
        // Get a list of all the decks that we have already used.
        NSDictionary *dictionary = [SMRGlobals singleton].dictionary;
        NSMutableArray *decksAlreadyUsed = [[NSMutableArray alloc] init];
        if (![self.hero1 isEqualToString:@"Random"]  && n != 0) {[decksAlreadyUsed addObject:[(SMRDeck*) dictionary[self.hero1] deck]];}
        if (![self.hero2 isEqualToString:@"Random"]  && n != 1) {[decksAlreadyUsed addObject:[(SMRDeck*) dictionary[self.hero2] deck]];}
        if (![self.hero3 isEqualToString:@"Random"]  && n != 2) {[decksAlreadyUsed addObject:[(SMRDeck*) dictionary[self.hero3] deck]];}
        if (self.numberOfPlayers>=4 && ![self.hero4 isEqualToString:@"Random"]  && n != 3) {[decksAlreadyUsed addObject:[(SMRDeck*) dictionary[self.hero4] deck]];}
        if (self.numberOfPlayers>=5 && ![self.hero5 isEqualToString:@"Random"]  && n != 4) {[decksAlreadyUsed addObject:[(SMRDeck*) dictionary[self.hero5] deck]];}
    
        for(int i=0; i< [decks count]; i++){
            SMRDeck *deck = [decks objectAtIndex:i];
            if (deck.available && ![decksAlreadyUsed containsObject:deck.deck]) {
                // If this isn't a deck we already have.
                [stringArray addObject:deck.name];
            }
        }
        [stringArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        return stringArray;// Sort all the heroes.  Should we sort by deck, or by expansion?  I'll think about this.
    }
}

@end