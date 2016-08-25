//
//  SetCard.m
//  Ex3
//
//  Created by zur tene on 25/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
int const FULL_FILL = 1;
int const EMPTY_FILL = 2;
int const SEMI_FILL = 3;
int const RED_COLOR = 4;
int const GREEN_COLOR = 5;
int const BLUE_COLOR = 6;
int const TRIANGLE_SHAPE = 7;
int const SQUARE_SHAPE = 8;
int const CIRCLE_SHAPE = 9;

+(NSArray *) validFills{
    return @[@(FULL_FILL), @(SEMI_FILL), @(EMPTY_FILL)];
}
+(NSArray *) validColors{
    return @[@(RED_COLOR), @(GREEN_COLOR), @(BLUE_COLOR)];
}
+(NSArray *) validShapes{
    return @[@(TRIANGLE_SHAPE), @(SQUARE_SHAPE), @(CIRCLE_SHAPE)];
}
+ (NSArray *)validAmounts{
    return @[@1,@2,@3];
}
- (NSString *)contents{
    return [NSString stringWithFormat:@"%d: amount, %d: shape, %d: fill, %d: color", self.amount, self.shape, self.fill, self.color];
}

- (int)match:(NSArray *)otherCards{
    int score = 0;
    if ([otherCards count] != 2){
        return score;
    }
    SetCard *firstCard = self;
    SetCard *secondCard = otherCards[0];
    SetCard *thirdCard = otherCards[1];
    
    //Check Shape:
    if ((firstCard.shape == secondCard.shape && secondCard.shape == thirdCard.shape) || (
        (firstCard.shape != secondCard.shape) && (secondCard.shape != thirdCard.shape) && (firstCard.shape != thirdCard.shape))){
        score = 1;
    }
    if ((firstCard.color == secondCard.color && secondCard.color == thirdCard.color) || (
        (firstCard.color != secondCard.color) && (secondCard.color != thirdCard.color) && (firstCard.color != thirdCard.color))){
        score = 1;
    }
    if ((firstCard.fill == secondCard.fill && secondCard.fill == thirdCard.fill) || (
        (firstCard.fill != secondCard.fill) && (secondCard.fill != thirdCard.fill) && (firstCard.fill != thirdCard.fill ))){
        score = 1;
    }
    return score;
}
@end
