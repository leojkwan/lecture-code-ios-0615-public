//
//  ViewController.m
//  CocoaPodsIntro
//
//  Created by Timothy Clem on 6/19/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import <TSMessages/TSMessage.h>

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)alertButtonTapped:(id)sender
{
    [TSMessage showNotificationWithTitle:@"An alert!"
                                subtitle:@"Awesome Cocoapod!"
                                    type:TSMessageNotificationTypeSuccess];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
