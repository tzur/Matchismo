#import <Foundation/Foundation.h>
#import "Card.h"
/// Object Deck uses to represent a deck of cards.
@interface Deck : NSObject

/// This method adds a card to the deck, if atTop is true then it will be on the deck's top.
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
/// This methods simply add the given card to the deck.
- (void)addCard:(Card *)card;
/// This methods simply draw a random card from the deck.
- (Card *)drawRandomCard;

@end