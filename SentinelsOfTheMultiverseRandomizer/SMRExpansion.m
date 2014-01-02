//
//  SMRExpansion.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/22/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRExpansion.h"
#include "SMRDataClass.h"

@implementation SMRExpansion
- (id)init:(NSString*) name heroes:(NSArray*) heroes villains:(NSArray*) villains environments:(NSArray*) environments imageName: (NSString*) imageName {
    if (self = [super init]) {
        self.name = name;
        self.heroes = heroes;
        self.villains = villains;
        self.environments = environments;
        self.imageName = imageName;
    }
    return self;
}

//Returns @"YES", @"NO", @"PARTIAL", or @"EMPTY"
-(NSString*) getAvailability {
    BOOL containsSome = NO;
    BOOL missingSome = NO;

    NSDictionary *dictionary = [[SMRGlobals singleton] dictionary];
    
    // Check the heroes
    for(NSInteger i = 0; i < [[self heroes] count]; i++) {
        NSString *name = [self.heroes objectAtIndex:i];
        SMRDeck *deck = dictionary[name];
        if(deck.available){
            containsSome=YES;
        } else {
            missingSome=YES;
        }
    }
    
    //Check the villains
    for(NSInteger i = 0; i < [[self villains] count]; i++) {
        NSString *name = [self.villains objectAtIndex:i];
        SMRDeck *deck = dictionary[name];

        if(deck.available){
            containsSome=YES;
        } else {
            missingSome=YES;
        }
    }
    
    //Check the environments
    for(NSInteger i = 0; i < [[self environments] count]; i++) {
        NSString *name = [self.environments objectAtIndex:i];
        SMRDeck *deck = dictionary[name];
        if(deck.available){
            containsSome=YES;
        } else {
            missingSome=YES;
        }
    }
    
    if (containsSome && missingSome) {return @"PARTIAL";}
    if (containsSome && !missingSome) {return @"YES";}
    if (!containsSome && missingSome) {return @"NO";}
    return @"EMPTY";
}


// Recursively sets the availability of all the heroes, villains, and enviroments owned by the expansion
-(void) setAvailability:(BOOL) available {
    NSDictionary *dictionary = [[SMRGlobals singleton] dictionary];

    // Check the heroes
    for(NSInteger i = 0; i < [[self heroes] count]; i++) {
        NSString *name = [self.heroes objectAtIndex:i];
        SMRDeck *deck = dictionary[name];
        [deck setAvailable:available];
    }
    // Check the villains
    for(NSInteger i = 0; i < [[self villains] count]; i++) {
        NSString *name = [self.villains objectAtIndex:i];
        SMRDeck *deck = dictionary[name];
        [deck setAvailable:available];
    }
    // Check the enviroments
    for(NSInteger i = 0; i < [[self environments] count]; i++) {
        NSString *name = [self.environments objectAtIndex:i];
        SMRDeck *deck = dictionary[name];
        [deck setAvailable:available];
    }
}

@end