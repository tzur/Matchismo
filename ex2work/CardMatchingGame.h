#import <Foundation/Foundation.h>
#import "Deck.h"

/// Object CardMatchingGame is the game handler of a card matching game.
@interface  CardMatchingGame : NSObject
@property (nonatomic, getter=isGameStarted) BOOL gameStarted;

@property (nonatomic) NSInteger amountOfMatchingCards;
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong) NSMutableDictionary *gameStatus;

// Static getter for the Matched constant.
+ (int)MATCHED_CONST;
/// Static getter for the Pennalty constant.
+ (int)PENNALTY_CONST;
/// Static getter for the score key string at gameStatus dictionary.
+ (NSString *)scoreKeyForGameStatus;
/// Static getter for the card amount key string at gameStatus dictionary.
+ (NSString *)cardsAmountKeyForGameStatus;
/// Static getter for the action key string at gameStatus dictionary.
+ (NSString *)actionKeyForGameStatus;
/// Static getter for the chosen card key string at gameStatus dictionary.
+ (NSString *)chosenCardsKeyForGameStatus;

/// Default initializer of CardMatchingGame it receives the amount of cards and the deck.
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*) deck;
/// Second initializer of CardMatchingGame it receives the match (2 or 3 match).
- (instancetype)initWithCardCountAndMatching:(NSUInteger)count usingDeck:(Deck *)deck usingMatch:(NSUInteger)match;
/// This method simply choosing a card at the given index.
- (void)chooseCardAtIndex:(NSUInteger)index;
/// This method is a getter for a card at the given index.
- (Card *)cardAtIndex:(NSUInteger)index;


@end
