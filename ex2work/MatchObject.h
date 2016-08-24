//
//  MatchObject.h
//  ex2work
//
//  Created by zur tene on 23/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface MatchObject : NSObject
@property (nonatomic) int matchScore;
@property (nonatomic, strong) NSString *matchLabel;

- (void)matcher:(NSArray *)playingCards; //PlayingCards.

- (void)appendScoreToLabel:(int)score;
- (void)appendPenalty:(int)penallty;
- (void)resetLabel;

@end
