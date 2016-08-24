//
//  Card.m
//  Ex1
//
//  Created by zur tene on 22/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//
#import "Card.h"

@interface Card()
@end
@implementation Card


- (int)match:(NSArray *)otherCards{
    int score = 0;
    for (Card *card in otherCards){
        if ([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}

@end
