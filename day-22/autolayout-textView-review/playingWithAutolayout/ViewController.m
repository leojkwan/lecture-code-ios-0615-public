//
//  ViewController.m
//  autolayout-textview
//
//  Created by Tom OMalley on 6/29/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) NSLayoutConstraint *textViewBottom;
@end

@implementation ViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    
    [self removeOriginalConstraints];
    [self constrainButtons];
    [self constrainTextView];
}

#pragma mark - Constraints

-(void) removeOriginalConstraints
{
    [self.view removeConstraints: self.view.constraints];
    [self.textView removeConstraints: self.textView.constraints];
    [self.leftButton removeConstraints: self.leftButton.constraints];
    [self.rightButton removeConstraints: self.rightButton.constraints];
    
    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
}

-(void) constrainButtons
{
    NSLayoutConstraint *leftButtonLeft = [NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    [self.view addConstraint: leftButtonLeft];
    
    NSLayoutConstraint *leftButtonBottom = [NSLayoutConstraint constraintWithItem:self.leftButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    [self.view addConstraint: leftButtonBottom];
    
    NSLayoutConstraint *rightButtonRight = [NSLayoutConstraint constraintWithItem:self.rightButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    [self.view addConstraint: rightButtonRight];
    
    NSLayoutConstraint *rightButtonBottom = [NSLayoutConstraint constraintWithItem: self.rightButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    [self.view addConstraint: rightButtonBottom];
}

-(void) constrainTextView {
    
    NSLayoutConstraint *textViewTop = [NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint: textViewTop];
    
    NSLayoutConstraint *textViewWidth = [NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-20];
    [self.view addConstraint:textViewWidth];
    
    NSLayoutConstraint *textViewCenterX = [NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:textViewCenterX];
    
    self.textViewBottom = [NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.rightButton attribute:NSLayoutAttributeTop multiplier:1.0 constant:-20];
    [self.view addConstraint:self.textViewBottom];
}

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
         
         if(UIInterfaceOrientationIsPortrait(orientation))
         {
             NSLog(@"switching to portrait");
             self.textViewBottom.constant = -20;
         }
         else if(UIInterfaceOrientationIsLandscape(orientation))
         {
             NSLog(@"switching to landscape");
             self.textViewBottom.constant = -10;
         }
     } completion:nil];
}


@end
