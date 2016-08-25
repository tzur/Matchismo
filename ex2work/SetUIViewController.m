//
//  SetUIViewController.m
//  Ex3
//
//  Created by zur tene on 24/08/2016.
//  Copyright © 2016 zur tene. All rights reserved.
//

#import "SetUIViewController.h"
@interface SetUIViewController()
@property (weak, nonatomic) IBOutlet UILabel *labelCheck;

@end
@implementation SetUIViewController
- (void)viewDidLoad{
    self.labelCheck.text = @"Dogs";
}
@end
