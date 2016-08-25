//
//  SetUIViewController.m
//  Ex3
//
//  Created by zur tene on 24/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import "SetUIViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"
@interface SetUIViewController()
@end
static int counter = 0;
@implementation SetUIViewController

-(Deck *)createDeck{
    return [[SetCardDeck alloc] init];
}
-(NSUInteger)getMatchNumber{
    return 3;
}

-(NSString *)cardsArrayToLabelString:(NSArray *)cards{
    NSString *tempLabel = @"";
    return tempLabel;
}
- (NSAttributedString *)titleForCard:(Card *) card{
    NSMutableAttributedString *retValue = [[NSMutableAttributedString alloc] init];
    SetCard *setCard = (SetCard *)card;
    NSAttributedString *shapeString;
    if (setCard.shape == CIRCLE_SHAPE){
        shapeString = [[NSAttributedString alloc] initWithString:@"○ " attributes:@{}];
    }else if (setCard.shape == TRIANGLE_SHAPE){
        shapeString = [[NSAttributedString alloc] initWithString:@"△ " attributes:@{}];
    }else{
        shapeString = [[NSAttributedString alloc] initWithString:@"☐ " attributes:@{}];
    }
    for (int i=0; i<setCard.amount; i++){
        [retValue appendAttributedString:shapeString];
    }
    NSShadow *shadowFill = [[NSShadow alloc] init];
    shadowFill.shadowColor = [UIColor blackColor];
    shadowFill.shadowBlurRadius = (float) 2;
    
    if (setCard.fill == FULL_FILL){
        [retValue addAttribute:NSStrokeWidthAttributeName value:@-1 range:NSMakeRange(0, [retValue length])];
    }else if (setCard.fill == SEMI_FILL){
        [retValue addAttribute:NSShadowAttributeName value:shadowFill range:NSMakeRange(0, [retValue length])];
    }else{
        [retValue addAttribute:NSStrokeWidthAttributeName value:@1 range:NSMakeRange(0, [retValue length])];
    }

    if (setCard.color == RED_COLOR){
        [retValue addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, [retValue length])];
    }else if (setCard.color == BLUE_COLOR){
        [retValue addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, [retValue length])];
    }else{
        [retValue addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, [retValue length])];
    }
    counter++;

    return retValue;
}
- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:@"blankcardsmall"];
}

- (void)cardSpecialUIButton:(UIButton *)cardButton forCard:(Card *)card{
    if (card.isChosen && !card.isMatched){
        cardButton.layer.borderWidth = 1;
        cardButton.layer.borderColor = [[UIColor blackColor] CGColor];
    }else{
        cardButton.layer.borderWidth = 0;

    }
}

@end
