//
//  SMRGlobals.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/27/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRGlobals.h"
#import "SMRDataClass.h"

#define version

@implementation SMRGlobals


+(SMRGlobals *)singleton {
    static dispatch_once_t pred;
    static SMRGlobals *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[SMRGlobals alloc] init];
    });
    return shared;
}

//In theory, we can call the global variables like
//[[SMRGlobals singleton] variableName]
// assuming we have a getter defined as the variable name

-(void)saveData
{
    NSData *data;
    
    data = [NSKeyedArchiver archivedDataWithRootObject:self.pastGames];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"pastGames"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:self.notUploadGameStatistics] forKey:@"notUploadGameStatistics"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:self.allowDuplicateHeroes] forKey:@"allowDuplicateHeroes"];
    
    //Now generate a list of available things.  We don't want to bother saving the entire deck lists.
    NSMutableArray *availables = [[NSMutableArray alloc] init];
    for(NSInteger i = 0; i<self.villains.count;i++) {
        SMRDeck *deck = [self.villains objectAtIndex:i];
        if (deck.available) [availables addObject:deck.name];
    }
    for(NSInteger i = 0; i<self.environments.count;i++) {
        SMRDeck *deck = [self.environments objectAtIndex:i];
        if (deck.available) [availables addObject:deck.name];
    }
    for(NSInteger i = 0; i<self.heroes.count;i++) {
        SMRDeck *deck = [self.heroes objectAtIndex:i];
        if (deck.available) [availables addObject:deck.name];
    }
    data = [NSKeyedArchiver archivedDataWithRootObject:availables];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"availables"];

    
    
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"villains"];
//    
//    data = [NSKeyedArchiver archivedDataWithRootObject:self.environments];
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"environments"];
//    
//    data = [NSKeyedArchiver archivedDataWithRootObject:self.heroes];
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"heroes"];
//    
//    data = [NSKeyedArchiver archivedDataWithRootObject:self.pastGames];

    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end

