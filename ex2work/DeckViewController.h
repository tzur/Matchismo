//
//  ViewController.h
//  ex2work
//
//  Created by zur tene on 23/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface DeckViewController : UIViewController

- (Deck *)createDeck; //Interface.
-(NSUInteger)getMatchNumber; //Interface.
- (void)cardSpecialUIButton:(UIButton *)cardButton forCard:(Card *)card; //interface.
@end

