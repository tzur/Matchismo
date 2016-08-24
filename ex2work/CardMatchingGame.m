#import "CardMatchingGame.h"
@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score; //Redeclare score with private setter. (and getter of course).
@property (nonatomic, strong) NSMutableArray *cards; // Array of Card.
@property (nonatomic) int chosenCardsCounter; //initialized to 0.
@property (nonatomic, strong) NSMutableArray *chosenCards;
@end
@implementation CardMatchingGame

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;
static const int CONST_MATCH = 2;
static const int PENNALTY = 10;
static const int MATCHED = 11;
+ (NSString *)scoreKeyForGameStatus{
    return @"lastScore";
}
+ (NSString *)cardsAmountKeyForGameStatus{
    return @"chosenCardsAmount";
}
+ (NSString *)actionKeyForGameStatus{
    return @"lastAction";
}
+ (NSString *)chosenCardsKeyForGameStatus{
    return @"chosenCards";
}
+ (int)PENNALTY_CONST{
    return PENNALTY;
}
+ (int)MATCHED_CONST{
    return MATCHED;
}
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    return [self initWithCardCountAndMatching:count usingDeck:deck usingMatch:CONST_MATCH];
}

- (instancetype)initWithCardCountAndMatching:(NSUInteger)count usingDeck:(Deck *)deck usingMatch:(NSUInteger)match{
    self = [super init];
    if (self) {
        for (int i=0; i<count; i++){
            Card *card = [deck drawRandomCard];
            if (card){
                [self.cards addObject:card];
                self.amountOfMatchingCards = match;
                
            }else{
                self = nil;
            }
        }
        self.gameStarted = NO;
    }
    return self;
}
-(NSMutableDictionary *)gameStatus{
    
    if (!_gameStatus)   _gameStatus = [[NSMutableDictionary alloc] initWithDictionary:@{[CardMatchingGame scoreKeyForGameStatus]:[[NSNumber alloc] initWithInt:0],
                                                                                          [CardMatchingGame cardsAmountKeyForGameStatus]:[[NSNumber alloc] initWithInteger:self.amountOfMatchingCards]}];
    return _gameStatus;
}

- (NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count] ? self.cards[index] : nil);
}
-(NSMutableArray *)chosenCards{
    if (!_chosenCards) _chosenCards = [[NSMutableArray alloc] init];
    return _chosenCards;
}

- (void)reduseCardCounter{
    self.chosenCardsCounter--;
    [self updateGameStatus:0 chosenCards:@[] lastAction:0];
}
- (void)chooseCardAtIndex:(NSUInteger)index{
    self.gameStarted = YES;
    int matchScore = 0;
    int action = 0;
    Card *card = [self cardAtIndex: index];
    if (!card.isMatched){
        if (card.isChosen){
            card.chosen = NO;
            [self reduseCardCounter];
        }else{
            self.chosenCardsCounter++;
            //Check if we chosen enough cards.
            if (self.chosenCardsCounter == self.amountOfMatchingCards){
                //clear all the prev chosen cards.
                for (Card *otherCard in self.cards){
                    if (!otherCard.isMatched && otherCard.isChosen){
                        [self.chosenCards addObject:otherCard]; //add all the current cards.
                    }
                }
                // match the cards.
                matchScore = [card match:self.chosenCards];
                if (matchScore){
                    [self.chosenCards addObject:card];
                    for (Card *otherCard in self.chosenCards){
                        otherCard.matched = YES;
                        otherCard.chosen = YES;
                    }
                    self.chosenCardsCounter = 0;
                    matchScore = matchScore * MATCH_BONUS;
                    self.score += matchScore;
                    action = MATCHED;
                }else{ //Mismatch
                    [self.chosenCards addObject:card];
                    for (Card *otherCard in self.chosenCards){
                        otherCard.matched = NO;
                        otherCard.chosen = NO;
                    }
                    card.chosen = YES;
                    self.score -= MISMATCH_PENALTY;
                    matchScore = MISMATCH_PENALTY;
                    action = PENNALTY;
                    self.chosenCardsCounter = 1;
                    
                }
            }else{
                card.chosen = YES;
            }
            self.score -= COST_TO_CHOOSE;
            [self updateGameStatus:matchScore chosenCards:self.chosenCards lastAction:action];
            [self.chosenCards removeAllObjects]; //Clear all the chosen cards.
        }
    }
}
- (void)updateGameStatus:(int)matchScore chosenCards:(NSArray *)cards lastAction:(int)action{
    self.gameStatus[[CardMatchingGame cardsAmountKeyForGameStatus]] = [[NSNumber alloc] initWithLong:self.amountOfMatchingCards - self.chosenCardsCounter];
    self.gameStatus[[CardMatchingGame scoreKeyForGameStatus]] = [[NSNumber alloc] initWithInt:matchScore];
    self.gameStatus[[CardMatchingGame chosenCardsKeyForGameStatus]] = [cards copy];
    self.gameStatus[[CardMatchingGame actionKeyForGameStatus]] = [[NSNumber alloc] initWithInt:action];
}

- (void)setAmountOfMatchingCards:(NSInteger)amountOfMatchingCards{
    if (!self.gameStarted){
        _amountOfMatchingCards = amountOfMatchingCards;
    }
}

@end