//
//  SetCardDeck.m
//  Ex3
//
//  Created by zur tene on 25/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck
- (instancetype)init{
    self = [super init];
    if (self){
        for (NSNumber *shape in [SetCard validShapes]){
            for (NSNumber *fill in [SetCard validFills]){
                for (NSNumber *color in [SetCard validColors]){
                    for (NSNumber *amount in [SetCard validAmounts]){
                        SetCard *card = [[SetCard alloc] init];
                        card.fill = [fill intValue];
                        card.shape = [shape intValue];
                        card.color = [color intValue];
                        card.amount = [amount intValue];
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}

@end
