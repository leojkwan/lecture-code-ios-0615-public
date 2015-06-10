//
//  ViewController.m
//  WelcomeToViews
//
//  Created by Timothy Clem on 6/10/15.
//  Copyright (c) 2015 flatiron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;

-(IBAction)buttonTapped:(id)sender;

@end


@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

//    [self updateTime];
}

-(void)updateTime
{
    NSDate *now = [NSDate date];
    self.myLabel.text = now.description;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(IBAction)buttonTapped:(id)sender
{
    self.myLabel.text = self.userTextField.text;
    [self.userTextField endEditing:YES];

//    self.myButton.backgroundColor = [UIColor redColor];
//    [self updateTime];
}

- (IBAction)bigBackgroundButtonTapped:(id)sender
{
    [self.userTextField endEditing:YES];
}


@end
