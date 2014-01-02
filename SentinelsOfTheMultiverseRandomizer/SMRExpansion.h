//
//  SMRExpansion.h
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/22/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import <Foundation/Foundation.h>


// an expansion
@interface SMRExpansion : NSObject
@property NSString *name;
@property NSArray *heroes; //a list of NSStrings for the hero names
@property NSArray *villains;
@property NSArray *environments;
@property NSString *imageName;
- (id)init:(NSString*) name heroes:(NSArray*) heroes villains:(NSArray*) villains environments:(NSArray*) environments imageName: (NSString*) imageName;
-(NSString*) getAvailability;
-(void) setAvailability:(BOOL) available;
@end