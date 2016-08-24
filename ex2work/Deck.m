//
//  Deck.m
//  ex2work
//
//  Created by zur tene on 23/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}
- (void)addCard: (Card *)card{
    [self addCard:card atTop:NO];
}
- (Card *)drawRandomCard{
    Card * randomCard = nil;
    if ([self.cards count]){
        unsigned cardIndex = arc4random() % [self.cards count];
        randomCard = self.cards[cardIndex];
        [self.cards removeObjectAtIndex:cardIndex];
    }
    return randomCard;
}




@end
