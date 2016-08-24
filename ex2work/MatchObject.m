//
//  MatchObject.m
//  ex2work
//
//  Created by zur tene on 23/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//
#import "PlayingCard.h"
#import "MatchObject.h"
@interface MatchObject()

@end
@implementation MatchObject

-(NSString *)matchLabel{
    if (!_matchLabel) _matchLabel = @"";
    return _matchLabel;
}
- (void)matcher:(NSArray *)playingCards{

    self.matchScore = 0;
    for (int i=0;i<[playingCards count]; i ++){
        PlayingCard *firstCard = playingCards[i];
        self.matchLabel = [self.matchLabel stringByAppendingFormat:@" %@",firstCard.contents];
        for (int j=i+1; j<[playingCards count]; j++){
            NSLog(@"I is %d, J is %d, count is %lu", i,j, [playingCards count]);
            PlayingCard *secondCard = playingCards[j];
            if ([firstCard.suit isEqualToString:secondCard.suit]){
                self.matchScore += 1;
            }else if ( firstCard.rank == secondCard.rank){
              
                self.matchScore += 4;
            }
            
        }
    }
    
}
-(void)appendPenalty:(int)penallty{
    self.matchLabel = [self.matchLabel stringByAppendingFormat:@" Dont Match! Penallty is: -%d Points :(",penallty];

}
- (void)appendScoreToLabel:(int)score{
    self.matchLabel = [[@"Matched!" stringByAppendingString:self.matchLabel] stringByAppendingFormat:@" Earned %d Points :)",score];
}
- (void)resetLabel{
    self.matchLabel = @"";
}
@end
