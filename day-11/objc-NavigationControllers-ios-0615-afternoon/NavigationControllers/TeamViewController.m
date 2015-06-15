//
//  TeamViewController.m
//  NavigationControllers
//
//  Created by Timothy Clem on 6/15/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "TeamViewController.h"
#import "TeamDetailViewController.h"
#import "TeamMember.h"
#import "TeamMemberButton.h"

@interface TeamViewController ()

@property (weak, nonatomic) IBOutlet TeamMemberButton *alButton;
@property (weak, nonatomic) IBOutlet TeamMemberButton *joeButton;
@property (weak, nonatomic) IBOutlet TeamMemberButton *chrisButton;
@property (weak, nonatomic) IBOutlet TeamMemberButton *aviButton;

@end

@implementation TeamViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    TeamMember *joe = [[TeamMember alloc] initWithName:@"Joe" image:[UIImage imageNamed:@"joe.jpg"]];
    TeamMember *chris = [[TeamMember alloc] initWithName:@"Chris" image:[UIImage imageNamed:@"chris.jpg"]];
    TeamMember *avi = [[TeamMember alloc] initWithName:@"Avi" image:[UIImage imageNamed:@"avi.jpg"]];
    TeamMember *al = [[TeamMember alloc] initWithName:@"Al" image:[UIImage imageNamed:@"al.jpg"]];

    self.alButton.teamMember = al;
    self.joeButton.teamMember = joe;
    self.chrisButton.teamMember = chris;
    self.aviButton.teamMember = avi;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TeamDetailViewController *destination = segue.destinationViewController;
    TeamMemberButton *tappedButton = sender;
//    TeamMember *tappedTeamMember = [self teamMemberForSegueIdentifier:segue.identifier];

    destination.teamMember = tappedButton.teamMember;
}


@end
