#import "Card.h"

/// Object PlayingCard represents a normal playing card. ( 7 queen etc.).
@interface PlayingCard : Card
/// Suit will holds the card suit.
@property (strong, nonatomic) NSString *suit;
/// Will hold the card rank.
@property (nonatomic) NSUInteger rank;

/// Getter for the valid suits of this specific playing card.
+ (NSArray *)validSuits;
/// Getter for the maximum rank of this specific playing card.
+ (NSUInteger)maxRank;

@end