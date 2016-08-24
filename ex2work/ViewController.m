//
//  ViewController.m
//  ex2work
//
//  Created by zur tene on 23/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "Deck.h"
#import "CardMatchingGame.h"


@interface ViewController ()
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchState;
@end

@implementation ViewController
const static int TWO_MODE = 2;
const static int THREE_MODE = 3;

- (CardMatchingGame *)game{
    if (!_game) _game = [self createGame:TWO_MODE];
    return _game;
}
- (CardMatchingGame *)createGame:(NSUInteger)match{
     return [[CardMatchingGame alloc] initWithCardCountAndMatching:[self.cardButtons count] usingDeck:[self createDeck] usingMatch:match];
}
- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}


- (IBAction)touchCardButton:(UIButton *)sender {

    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}
-(NSString *)cardsArrayToLabelString:(NSArray *)cards{
    NSString *tempLabel = @"";
    for (Card *card in cards){
        tempLabel = [tempLabel stringByAppendingString:card.contents];
    }
    return tempLabel;
}
- (void)updateDescLabel{
    NSString *currentLabel = @"";
    NSDictionary *status = self.game.gameStatus;
    NSNumber *lastScoreObj = (NSNumber *)status[[CardMatchingGame scoreKeyForGameStatus]];
    NSNumber *lastAction = (NSNumber *)status[[CardMatchingGame actionKeyForGameStatus]];
    NSNumber *amountOfCardsRemainsToFlip = (NSNumber *)status[[CardMatchingGame cardsAmountKeyForGameStatus]];
    NSArray *chosenCards = (NSArray *)status[[CardMatchingGame chosenCardsKeyForGameStatus]];
    if ([lastAction integerValue] == [CardMatchingGame MATCHED_CONST]){
        currentLabel = [[@"Matched! " stringByAppendingString:[self cardsArrayToLabelString:chosenCards]]
                        stringByAppendingFormat:@" Earned %lu Points!",[lastScoreObj integerValue]];
    }else if ([lastAction integerValue] == [CardMatchingGame PENNALTY_CONST]){
            currentLabel = [[@"Argh, Maybe next time! " stringByAppendingString:[self cardsArrayToLabelString:chosenCards]]
                            stringByAppendingFormat:@" Pennalty of %lu Points!", [lastScoreObj integerValue]];
    }else{
        currentLabel = [NSString stringWithFormat:@"You need to flip %lu more cards!", [amountOfCardsRemainsToFlip integerValue]];
    }
    self.descLabel.text = currentLabel;
        
    
}
- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons){
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    if (self.game.gameStarted){
        self.switchState.enabled = NO;
        [self updateDescLabel];
    }else{
        self.switchState.enabled = YES;
        self.descLabel.text = @"It's A New Game!";
    }
    
}
- (NSString *)titleForCard:(Card *) card{
    return card.isChosen ? card.contents : @"";
}
- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"blankcardsmall" : @"stanford"];
}
- (IBAction)touchDealButton:(id)sender {
    if ([self.switchState isOn]){
       self.game = [self createGame:THREE_MODE];
    }else{
        self.game = [self createGame:TWO_MODE];
    }
    [self updateUI];
}
- (IBAction)touchSwitch:(UISwitch *)sender {
    if (!self.game.isGameStarted){
        if ([sender isOn]){
            self.game.amountOfMatchingCards = THREE_MODE;
            
        }else{
            self.game.amountOfMatchingCards = TWO_MODE;
            
        }
    }

}

@end
