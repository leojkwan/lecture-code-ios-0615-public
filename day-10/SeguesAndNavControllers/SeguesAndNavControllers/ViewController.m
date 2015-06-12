//
//  ViewController.m
//  SeguesAndNavControllers
//
//  Created by Timothy Clem on 6/12/15.
//  Copyright (c) 2015 flatiron. All rights reserved.
//

#import "ViewController.h"
#import "InstructorViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIButton *senderButton = sender;
    InstructorViewController *destination = segue.destinationViewController;

    destination.instructorName = senderButton.currentTitle;
}

@end
