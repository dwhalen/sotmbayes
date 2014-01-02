//
//  SMRGenerateGameViewController.h
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/24/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMRGameGeneration.h"
#import "SMRDisplayRandomGameViewController.h"

@interface SMRDifficulties : NSObject
@property NSArray *names;
@property NSArray *minpowers;
@property NSArray *maxpowers;
@end

@interface SMRGenerateGameViewController : UITableViewController
@property SMRPregenGame *game;
@property (strong, nonatomic) SMRDifficulties *difficulties;
@property NSInteger currentdifficulty;

-(void) stepperValueDidChange:(UIStepper *) stepper;
- (void) GenerateGameButton:(SMRDisplayRandomGameViewController*) game;
@end
