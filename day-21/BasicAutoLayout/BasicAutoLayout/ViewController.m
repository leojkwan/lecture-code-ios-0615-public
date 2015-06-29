//
//  ViewController.m
//  BasicAutoLayout
//
//  Created by Timothy Clem on 6/29/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIView *blueBox;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.label removeConstraints:self.label.constraints];

    // item1's attribute = item2's attribute * multiplier + constant
    NSLayoutConstraint *labelX = [NSLayoutConstraint constraintWithItem:self.label
                                                              attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeCenterX
                                                             multiplier:1
                                                               constant:0];
    [self.view addConstraint:labelX];

    NSLayoutConstraint *labelY = [NSLayoutConstraint constraintWithItem:self.label
                                                              attribute:NSLayoutAttributeCenterY
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeCenterY
                                                             multiplier:1.0
                                                               constant:0];
    [self.view addConstraint:labelY];


    NSLayoutConstraint *boxX = [NSLayoutConstraint constraintWithItem:self.blueBox
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.label
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
    [self.view addConstraint:boxX];


    NSLayoutConstraint *boxY = [NSLayoutConstraint constraintWithItem:self.blueBox
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.label
                                                            attribute:NSLayoutAttributeBaseline
                                                           multiplier:1
                                                             constant:0];
    [self.view addConstraint:boxY];


    NSLayoutConstraint *boxWidth = [NSLayoutConstraint constraintWithItem:self.blueBox
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.label
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1
                                                                 constant:0];
    [self.view addConstraint:boxWidth];

    NSLayoutConstraint *badBoxWidth = [NSLayoutConstraint constraintWithItem:self.blueBox
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                               toItem:self.label
                                            attribute:NSLayoutAttributeWidth
                                           multiplier:1
                                             constant:15];
    [self.view addConstraint:badBoxWidth];

    NSLayoutConstraint *boxHeight = [NSLayoutConstraint constraintWithItem:self.blueBox
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.blueBox
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1
                                                                  constant:0];
    [self.view addConstraint:boxHeight];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
