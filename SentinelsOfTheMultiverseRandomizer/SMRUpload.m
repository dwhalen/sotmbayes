//
//  SMRUpload.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/28/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRUpload.h"
#import "SMRDataClass.h"

@implementation SMRUpload


+ (void) upload {
    // Spawn a new thread to upload all the stuff
    [SMRUpload performSelectorInBackground:@selector(uploadThread) withObject:nil];
}

+ (void) uploadThread {
    
    NSMutableArray *pastGames = [[SMRGlobals singleton] pastGames];
    for (NSInteger i = 0; i < pastGames.count; i++) {
        SMRGame *game = [pastGames objectAtIndex:i];
        if (!game.uploaded) {
            // Try to upload the game.
            
            // We need to construct the request url.  We need the following information
            
            // deviceID
            NSString *s1 = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            //NSLog(s1);
            
            // gameID
            NSString *s2 = [NSString stringWithFormat:@"%d",game.GameID];
            //NSLog(s2);
            
            // generatedDate (measured in seconds since 1970
            NSString *s3 = [NSString stringWithFormat:@"%f",[game.generatedDate timeIntervalSince1970]];
            //NSLog(s3);
            
            // finishedDate
            NSString *s4 = [NSString stringWithFormat:@"%f",[game.finishedDate timeIntervalSince1970]];
            //NSLog(s4);
            
            // won
            NSString *s5 = game.won;
            
            // numberOfPlayers
            NSString *s6 = [NSString stringWithFormat:@"%d",game.numberOfPlayers];
            //NSLog(s6);
            
            // environment
            NSDictionary *dictionary = [[SMRGlobals singleton] dictionary];
            SMRDeck *deck = dictionary[game.environment];
            NSString *s7 = deck.publicName;
            
            // villain
            deck = dictionary[game.villain];
            NSString *s8 = deck.publicName;
            
            // hero1
            deck = dictionary[game.hero1];
            NSString *s9 = deck.publicName;
            
            // hero2
            deck = dictionary[game.hero2];
            NSString *s10 = deck.publicName;
            
            // hero3
            deck = dictionary[game.hero3];
            NSString *s11 = deck.publicName;
        
            // hero4
            NSString *s12;
            if (game.numberOfPlayers >= 4) {
                deck = dictionary[game.hero4];
                s12 = deck.publicName;
            } else {
                s12 = @"(none)";
            }
            
            // hero5
            NSString *s13;
            if (game.numberOfPlayers >= 5) {
                deck = dictionary[game.hero5];
                s13 = deck.publicName;
            } else {
                s13 = @"(none)";
            }
            
            // Now try to upload the thing
            NSString *urlString = [NSString stringWithFormat:@"http://sotmbayesianrandomizer.appspot.com/rpc?action=Store&params={\"numberOfHeroes\":\"%@\",\"environment\":\"%@\",\"villain\":\"%@\",\"hero1\":\"%@\",\"hero2\":\"%@\",\"hero3\":\"%@\",\"hero4\":\"%@\",\"hero5\":\"%@\",\"won\":\"%@\",\"generatedDate\":\"%@\",\"finishedDate\":\"%@\",\"gameID\":\"%@\",\"deviceID\":\"%@\"}",s6,s7,s8,s9,s10,s11,s12,s13,s5,s3,s4,s2,s1];
            //NSLog(urlString);
            NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//            
//            NSError* error = nil;
//            NSData* data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
//            if (error) {
//                NSLog(@"%@", error);
//            } else {
//                NSLog(@"Data has loaded successfully.");
//            }
//            NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
            
            [request setHTTPMethod: @"GET"];
            
            NSError *requestError;
            NSURLResponse *urlResponse = nil;
            
            
            NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
            NSString *ret = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
            //NSLog(@"ret=%@", ret);
            
            // If the data upload fails, stop trying to upload stuff.
            if ([ret isEqualToString:@"YES"]) {game.uploaded = YES; [[SMRGlobals singleton] saveData];
}
            
        }
    }
    
}

@end
