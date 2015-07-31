//
//  OurTabBarViewController.m
//  MultipleStoryboards
//
//  Created by Timothy Clem on 7/31/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "OurTabBarViewController.h"

@interface OurTabBarViewController ()

@end

@implementation OurTabBarViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *tabBarVCs = @[  [[UIStoryboard storyboardWithName:@"Tab1" bundle:nil] instantiateInitialViewController],
                             [[UIStoryboard storyboardWithName:@"Tab2" bundle:nil] instantiateInitialViewController] ];

    self.viewControllers = tabBarVCs;
}

@end
