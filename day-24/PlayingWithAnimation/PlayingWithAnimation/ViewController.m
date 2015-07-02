//
//  ViewController.m
//  PlayingWithAnimation
//
//  Created by Timothy Clem on 7/2/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pauseButtonRightConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pauseButtonRightConstraint.constant = 200;
}

-(IBAction)startButtonTapped:(id)sender
{
//    [UIView animateWithDuration:2 animations:^{
//        self.pauseButton.alpha = 1;
//        self.startButton.alpha = 0;
//
//        self.pauseButtonRightConstraint.constant = 0;
//        [self.view layoutIfNeeded];
//    }];

//    [UIView animateWithDuration:1 delay:0 options:0 animations:^{
//        self.pauseButton.alpha = 1;
//        self.startButton.alpha = 0;
//
//        self.pauseButtonRightConstraint.constant = 0;
//        [self.view layoutIfNeeded];
//    } completion:^(BOOL finished) {
//        NSLog(@"animation finished!");
//
//        [UIView animateWithDuration:1 animations:^{
//            self.view.backgroundColor = [UIColor redColor];
//        }];
//    }];

    // #rrggbb    00 - ff
    // B6 FD EE
//    [UIView animateWithDuration:5 animations:^{
//        self.view.backgroundColor = [UIColor colorWithRed:0xb6 / 255.0 green:0xfd / 255.0 blue:0xee / 255.0 alpha:1.0];
//    }];



    [UIView animateKeyframesWithDuration:2 delay:0 options:0 animations:^{
        self.view.backgroundColor = [UIColor greenColor];

        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            self.startButton.alpha = 0;
        }];

        [UIView addKeyframeWithRelativeStartTime:0.1 relativeDuration:0.2 animations:^{
            self.pauseButton.alpha = 1;

            self.pauseButtonRightConstraint.constant = 0;
            [self.view layoutIfNeeded];
        }];
    } completion:^(BOOL finished) {
        NSLog(@"Keyframe animation completed");
    }];


    NSLog(@"past the animate call");
}

-(IBAction)pauseButtonTapped:(id)sender
{
    self.pauseButton.alpha = 0;
    self.startButton.alpha = 1;
}

@end
