//
//  PlayingCardDeckViewController.m
//  Ex3
//
//  Created by zur tene on 25/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import "PlayingCardDeckViewController.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardDeckViewController
- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}
-(NSUInteger)getMatchNumber{
    return 2;
}

-(NSString *)cardsArrayToLabelString:(NSArray *)cards{
    NSString *tempLabel = @"";
    for (Card *card in cards){
        tempLabel = [tempLabel stringByAppendingString:card.contents];
    }
    return tempLabel;
}

@end
