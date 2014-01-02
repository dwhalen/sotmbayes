//
//  SMRDisplayRandomGameViewController.h
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/26/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMRGameGeneration.h"
#import "SMRDataClass.h"

@interface SMRDisplayRandomGameViewController : UITableViewController
@property NSString *errorMessage;
@property SMRGame *game;
@end
