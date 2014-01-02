//
//  SMRStyleCellForDeck.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/25/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRStyleCellForDeck.h"
#import "SMRDataClass.h"
#import "SMRExpansion.h"

@implementation SMRStyleCellForDeck
//+ (void) styleForDeckCell:(UITableViewCell*) cell deck: (SMRDeck*) deck{
//    cell.textLabel.text = deck.name;
//    return;
//}

+ (void) styleForRandomCell:(UITableViewCell*) cell{
    cell.textLabel.text = @"Random";
    cell.detailTextLabel.text = @"";
    cell.imageView.image = [UIImage imageNamed:@"randomimage.png"];
    return;
}

+ (void) styleForDeckCellByName:(UITableViewCell*) cell name:(NSString*) name {
    NSDictionary *dictionary = [SMRGlobals singleton].dictionary;
    SMRDeck *deck = dictionary[name];
    cell.textLabel.text = deck.displayText;
    cell.detailTextLabel.text = deck.detailName;
    if ([deck.imageName isEqualToString:@""]) {
        cell.imageView.image = [UIImage imageNamed:@"randomimage.png"];
    } else {
        cell.imageView.image = [UIImage imageNamed:deck.imageName];
    }
    return;
}

+ (void) styleForGameCellByName:(UITableViewCell*) cell name:(SMRGame*) game {
    if([game.won  isEqual: @"Win"]) {
        cell.textLabel.text = @"Victory!";
        cell.backgroundColor = [[UIColor alloc] initWithRed:0.8 green:1.0 blue:0.8 alpha:1.0];
    } else if ([game.won  isEqual: @"Loss"]){
        cell.textLabel.text = @"Defeat!";
        cell.backgroundColor = [[UIColor alloc] initWithRed:1.0 green:0.8 blue:0.8 alpha:1.0];
    } else {
        cell.textLabel.text = @"Unplayed";
        cell.backgroundColor = [[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];;
    }
    
    
    CGFloat iHeight = cell.frame.size.height *.9;
    CGFloat iWidth = iHeight * 300/441;
    
    switch(game.numberOfPlayers) {
        case 3: {
            [SMRStyleCellForDeck insertImage:game.hero1 intoCell:cell atLocation:0.05];
            [SMRStyleCellForDeck insertImage:game.hero2 intoCell:cell atLocation:1.1];
            [SMRStyleCellForDeck insertImage:game.hero3 intoCell:cell atLocation:2.15];
            [SMRStyleCellForDeck insertImage:game.villain intoCell:cell atLocation:3.2];
            [SMRStyleCellForDeck insertImage:game.environment intoCell:cell atLocation:4.25];
            break;
        }
        case 4: {
            [SMRStyleCellForDeck insertImage:game.hero1 intoCell:cell atLocation:0.05];
            [SMRStyleCellForDeck insertImage:game.hero2 intoCell:cell atLocation:0.05 + (2.1)/3];
            [SMRStyleCellForDeck insertImage:game.hero3 intoCell:cell atLocation:0.05 + 2*(2.1)/3];
            [SMRStyleCellForDeck insertImage:game.hero4 intoCell:cell atLocation:2.15];
            [SMRStyleCellForDeck insertImage:game.villain intoCell:cell atLocation:3.2];
            [SMRStyleCellForDeck insertImage:game.environment intoCell:cell atLocation:4.25];
            break;
        }
        case 5: {
            [SMRStyleCellForDeck insertImage:game.hero1 intoCell:cell atLocation:0.05];
            [SMRStyleCellForDeck insertImage:game.hero2 intoCell:cell atLocation:0.05 + (2.1)/4];
            [SMRStyleCellForDeck insertImage:game.hero3 intoCell:cell atLocation:0.05 + 2*(2.1)/4];
            [SMRStyleCellForDeck insertImage:game.hero4 intoCell:cell atLocation:0.05 + 3*(2.1)/4];
            [SMRStyleCellForDeck insertImage:game.hero5 intoCell:cell atLocation:2.1];
            [SMRStyleCellForDeck insertImage:game.villain intoCell:cell atLocation:3.2];
            [SMRStyleCellForDeck insertImage:game.environment intoCell:cell atLocation:4.25];
            break;
        }
    }

    cell.indentationWidth = iWidth * 5.3;

    return;
}

+ (void) insertImage:(NSString*) name intoCell: (UITableViewCell*) cell atLocation: (CGFloat) location {
    NSDictionary *dictionary = [[SMRGlobals singleton] dictionary];
    NSString *imageName = [(SMRDeck*) dictionary[name] imageName];
    
    CGFloat iHeight = cell.frame.size.height *.9;
    CGFloat iWidth = iHeight * 300/441;
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(location*iWidth,cell.frame.size.height *.05, iWidth, iHeight)];
    [imageView setImage:[UIImage imageNamed:imageName]];
    [cell.contentView addSubview:imageView];
    //[cell addSubview:imageView];
}


+ (void) styleForExpansionCellByExpansion:(UITableViewCell*) cell name:(SMRExpansion*) expansion{
    cell.textLabel.text = expansion.name;
    cell.imageView.image = [UIImage imageNamed:expansion.imageName];
}


@end