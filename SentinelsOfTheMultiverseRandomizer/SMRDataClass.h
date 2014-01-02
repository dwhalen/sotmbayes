//
//  SMRDataClass.h
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/21/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMRGlobals.h"


#define WIN 1
#define LOSS 0
#define UNPLAYED -1

// a single game
@interface SMRGame : NSObject <NSCoding>
@property NSInteger numberOfPlayers;
@property NSString *villain;
@property NSString *environment;
@property NSString *hero1;
@property NSString *hero2;
@property NSString *hero3;
@property NSString *hero4;
@property NSString *hero5;

@property BOOL uploaded;
@property NSString *won; //"Win", "Loss", or "Unplayed"

@property NSDate *generatedDate;
@property NSDate *finishedDate;
    
@property NSInteger GameID;

- (id)initGameWithPlayers:(NSInteger)numberOfPlayers villain:(NSString*) villain environment:(NSString*) environment hero1:(NSString*) hero1 hero2:(NSString*) hero2 hero3:(NSString*) hero3 hero4:(NSString*) hero4 hero5:(NSString*) hero5;

- (void)setVictory:(NSString*) won;
- (double) getWinRateFromGame;

@end


//    SMRDeck *v1=[[SMRDeck alloc] init:@"Akash\'bhuta" publicName:@"Akash\'bhuta" displayText:@"Akash\'bhuta" detailName:@"" deck:@"Akash'bhuta" power3:@(84.30) power4:@(41.10) power5:@(41.10) imageFile:@""];

// a single deck of cards
@interface SMRDeck : NSObject
@property NSString *publicName;
@property NSString *displayText;
@property NSString *detailName;
@property NSString *name;
@property NSString *deck;
@property NSNumber *score3;
@property NSNumber *score4;
@property NSNumber *score5;
@property BOOL available;
- (id)init:(NSString*)name publicName: (NSString*) publicName displayText: (NSString*) displayText detailName: (NSString*) detailName deck:(NSString*) deck score3:(NSNumber*) score3 score4:(NSNumber*) score4 score5:(NSNumber*) score5 imageName: (NSString*) imageName ;
@property NSString *imageName;
@end





