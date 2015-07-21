//
//  BigTextViewController.m
//  PhoneUI
//
//  Created by Timothy Clem on 7/21/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "BigTextViewController.h"

@interface BigTextViewController ()

@end

@implementation BigTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];

    self.title = self.textToDisplay;

    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:72];
    label.text = self.textToDisplay;
    [self.view addSubview:label];
    label.translatesAutoresizingMaskIntoConstraints = NO;

    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[label]-|" options:0 metrics:nil views:@{ @"label": label }];

    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[label]-|" options:0 metrics:nil views:@{ @"label": label }];

    [self.view addConstraints:hConstraints];
    [self.view addConstraints:vConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
