//
//  PlayingCard.m
//  Ex1
//
//  Created by zur tene on 22/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//


#import "PlayingCard.h"
@implementation PlayingCard

const static int LOW_MATCH = 1;
const static int HIGH_MATCH = 4;

@synthesize suit = _suit;

+(NSArray *)rankStrings{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}
+ (NSArray *)validSuits{
    return @[@"♠︎",@"♦︎", @"♥︎",@"♣︎"];
}

+ (NSUInteger)maxRank{
    return [[PlayingCard rankStrings] count] - 1;
}
- (NSString *)contents{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}


- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
- (NSString *)suit{
    return _suit ? _suit: @"?";
}

- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}
// Override.
- (int)match:(NSArray *)otherCards{
    int score = 0;
    NSMutableArray *cards = [otherCards mutableCopy];
    [cards addObject:self];
    for (int i=0;i<[cards count]; i ++){
        PlayingCard *firstCard = cards[i];
        for (int j=i+1; j<[cards count]; j++){
            PlayingCard *secondCard = cards[j];
            if ([firstCard.suit isEqualToString:secondCard.suit]){
                score += LOW_MATCH;
            }else if ( firstCard.rank == secondCard.rank){
                
                score += HIGH_MATCH;
            }
            
        }
    }
    return score;
}
@end