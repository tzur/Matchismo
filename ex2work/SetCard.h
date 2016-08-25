//
//  SetCard.h
//  Ex3
//
//  Created by zur tene on 25/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

extern int const FULL_FILL;
extern int const EMPTY_FILL;
extern int const SEMI_FILL;
extern int const RED_COLOR;
extern int const GREEN_COLOR;
extern int const BLUE_COLOR;
extern int const TRIANGLE_SHAPE;
extern int const SQUARE_SHAPE;
extern int const CIRCLE_SHAPE;


@interface SetCard : Card
@property (nonatomic) int shape;
@property (nonatomic) int fill;
@property (nonatomic) int color;
@property (nonatomic) int amount;

+(NSArray *)validShapes;
+(NSArray *)validFills;
+(NSArray *)validColors;
+(NSArray *)validAmounts;

@end
