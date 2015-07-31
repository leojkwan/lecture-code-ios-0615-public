//
//  SuccessfulLoginViewController.m
//  MultipleStoryboards
//
//  Created by Timothy Clem on 7/31/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "SuccessfulLoginViewController.h"

@interface SuccessfulLoginViewController ()

@end

@implementation SuccessfulLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)logInButtonTapped:(id)sender
{
    UIStoryboard *profileStoryboard = [UIStoryboard storyboardWithName:@"ProfileFlow" bundle:nil];
    UIViewController *initialProfileVC = [profileStoryboard instantiateInitialViewController];

//    [self.navigationController pushViewController:initialProfileVC animated:YES];

    // the login VC is presented modally, so we need to dismiss it
    // and then we need to show our new profile VC

//    [self dismissViewControllerAnimated:YES completion:^{
//        [self presentViewController:initialProfileVC animated:YES completion:nil];
//    }];

    UIViewController *presentingViewController = self.presentingViewController;
    [presentingViewController dismissViewControllerAnimated:NO completion:^{
        [presentingViewController.navigationController presentViewController:initialProfileVC animated:YES completion:nil];
    }];
}

@end
