//
//  SMRDataClass.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/21/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRDataClass.h"
#import "SMRMath.h"



@implementation SMRGame

//Encoding and decoding.  Fuck this.
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInt:self.numberOfPlayers forKey:@"numberOfPlayers"];
    [aCoder encodeObject:self.villain forKey:@"villain"];
    [aCoder encodeObject:self.environment forKey:@"environment"];
    [aCoder encodeObject:self.hero1 forKey:@"hero1"];
    [aCoder encodeObject:self.hero2 forKey:@"hero2"];
    [aCoder encodeObject:self.hero3 forKey:@"hero3"];
    [aCoder encodeObject:self.hero4 forKey:@"hero4"];
    [aCoder encodeObject:self.hero5 forKey:@"hero5"];
    [aCoder encodeBool:self.uploaded forKey:@"uploaded"];
    [aCoder encodeObject:self.won forKey:@"won"];
    [aCoder encodeObject:self.generatedDate forKey:@"generatedDate"];
    [aCoder encodeObject:self.finishedDate forKey:@"finishedDate"];
    [aCoder encodeInt:self.GameID forKey:@"GameID"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    self.numberOfPlayers = [aDecoder decodeIntForKey:@"numberOfPlayers"];
    self.villain = (NSString*)[aDecoder decodeObjectForKey:@"villain"];
    self.environment = (NSString*)[aDecoder decodeObjectForKey:@"environment"];
    self.hero1 = (NSString*)[aDecoder decodeObjectForKey:@"hero1"];
    self.hero2 = (NSString*)[aDecoder decodeObjectForKey:@"hero2"];
    self.hero3 = (NSString*)[aDecoder decodeObjectForKey:@"hero3"];
    self.hero4 = (NSString*)[aDecoder decodeObjectForKey:@"hero4"];
    self.hero5 = (NSString*)[aDecoder decodeObjectForKey:@"hero5"];
    self.uploaded = (bool)[aDecoder decodeBoolForKey:@"uploaded"];
    self.won = (NSString*)[aDecoder decodeObjectForKey:@"won"];
    self.generatedDate = (NSDate*)[aDecoder decodeObjectForKey:@"generatedDate"];
    self.finishedDate = (NSDate*)[aDecoder decodeObjectForKey:@"finishedDate"];
    self.GameID = [aDecoder decodeIntForKey:@"GameID"];
return self;
}


- (id)initGameWithPlayers:(NSInteger)numberOfPlayers villain:(NSString*) villain environment:(NSString*) environment hero1:(NSString*) hero1 hero2:(NSString*) hero2 hero3:(NSString*) hero3 hero4:(NSString*) hero4 hero5:(NSString*) hero5 {
    //Creates a new game and initiallizes everything
    if ((self = [super init])) {
        self.numberOfPlayers = numberOfPlayers;
        self.villain = villain;
        self.environment = environment;
        self.hero1 = hero1;
        self.hero2 = hero2;
        self.hero3 = hero3;
        self.hero4 = hero4;
        self.hero5 = hero5;
        self.uploaded = YES;
        self.won = @"Unplayed";
        self.generatedDate = [NSDate date];
        self.finishedDate = nil;
        self.GameID = arc4random() % 100000000;
    }
    return self;
}

- (double) getWinRateFromGame {
    return [SMRMath getWinRateFromNames:self.numberOfPlayers hero1:self.hero1 hero2:self.hero2 hero3:self.hero3 hero4:self.hero4 hero5:self.hero5 villain:self.villain environment:self.environment];
}

- (void)setVictory:(NSString*) won {
    //Marks a game as complete and gives it a finished date.
    self.finishedDate = [NSDate date];
    self.uploaded = NO;
    self.won = won;
    
    [[SMRGlobals singleton] saveData];
   // [[SMRGlobals singleton] upl]
}

@end

@implementation SMRDeck
//    SMRDeck *v1=[[SMRDeck alloc] init:@"Akash\'bhuta" publicName:@"Akash\'bhuta" displayText:@"Akash\'bhuta" detailName:@"" deck:@"Akash'bhuta" power3:@(84.30) power4:@(41.10) power5:@(41.10) imageFile:@""];

- (id)init:(NSString*) name publicName: (NSString*) publicName displayText: (NSString*) displayText detailName: (NSString*) detailName deck:(NSString*) deck score3:(NSNumber*) score3 score4:(NSNumber*) score4 score5:(NSNumber*) score5 imageName: (NSString*) imageName{
    if ((self = [super init])) {
        self.publicName = publicName;
        self.displayText = displayText;
        self.detailName = detailName;
        self.name = name;
        self.deck = deck;
        self.score3 = score3;
        self.score4 = score4;
        self.score5 = score5;
        self.available = NO;
        self.imageName = imageName;
    }
    return self;
}

@end


