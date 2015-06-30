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

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view removeConstraints:self.view.constraints];
    [self prepareViewForAutolayout:self.label];
    [self prepareViewForAutolayout:self.blueBox];

    NSDictionary *viewsDictionary = @{ @"label": self.label,
                                       @"blueBox": self.blueBox };

    NSDictionary *metrics = @{ @"myPadding": @100 };

    NSArray *hLabelConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-(myPadding)-[label]-(myPadding)-|"
                                                                             options:0
                                                                             metrics:metrics
                                                                               views:viewsDictionary];
    [self.view addConstraints:hLabelConstraints];

    NSArray *hBoxConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[blueBox(==label)]-|" options:0 metrics:nil views:viewsDictionary];

    [self.view addConstraints:hBoxConstraints];


    NSLayoutConstraint *boxHeightConstraint = [NSLayoutConstraint constraintWithItem:self.blueBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.blueBox attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self.view addConstraint:boxHeightConstraint];
}

-(void)prepareViewForAutolayout:(UIView *)view
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view removeConstraints:self.view.constraints];
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
