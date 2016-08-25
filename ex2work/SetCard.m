//
//  SetCard.m
//  Ex3
//
//  Created by zur tene on 25/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

-(NSArray *) validFills{
    return @[@FULL_FILL, @SEMI_FILL, @EMPTY_FILL];
}
-(NSArray *) validColors{
    return @[@RED, @GREEN, @BLUE];
}
-(NSArray *) validShapes{
    return @[@TRIANGLE, @SQUARE, @CIRCLE];
}
@end
