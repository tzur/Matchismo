//
//  SetCard.h
//  Ex3
//
//  Created by zur tene on 25/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

#define FULL_FILL 1
#define EMPTY_FILL 2
#define SEMI_FILL 3
#define RED 4
#define GREEN 5
#define BLUE 6
#define TRIANGLE 7
#define SQUARE 8
#define CIRCLE 9

@interface SetCard : Card
@property (nonatomic, strong) NSString *shape;
@property (nonatomic) int shapeFill;
@property (nonatomic) int shapeColor;

-(NSArray *)validShapes;
-(NSArray *)validFills;
-(NSArray *)validColors;
@end
