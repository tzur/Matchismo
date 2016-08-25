//
//  HistoryViewController.m
//  Ex3
//
//  Created by zur tene on 25/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController()
@property (weak, nonatomic) IBOutlet UITextView *historyTextLabel;


@end

@implementation HistoryViewController
-(void)viewDidLoad{
    NSString *tempText = @"";
    int counter  = 0;
    if (![self.historyDetails count]){
        tempText = @"You done nothing, what do you expect to find here?";
    }else{
        for (NSString *eventString in self.historyDetails){
            counter++;
            tempText = [tempText stringByAppendingString:[NSString stringWithFormat:@"%d) %@\r", counter ,eventString]];
            
        }
    }
    self.historyTextLabel.text = tempText;
    
}
@end
