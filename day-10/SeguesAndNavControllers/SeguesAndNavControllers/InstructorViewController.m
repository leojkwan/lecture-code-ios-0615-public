//
//  InstructorViewController.m
//  SeguesAndNavControllers
//
//  Created by Timothy Clem on 6/12/15.
//  Copyright (c) 2015 flatiron. All rights reserved.
//

#import "InstructorViewController.h"

@interface InstructorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *instructorNameLabel;

@end


@implementation InstructorViewController

-(IBAction)dismissButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.instructorNameLabel.text = self.instructorName;

    self.title = self.instructorName;
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
