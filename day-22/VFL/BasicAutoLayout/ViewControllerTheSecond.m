//
//  ViewControllerTheSecond.m
//  BasicAutoLayout
//
//  Created by Timothy Clem on 6/30/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewControllerTheSecond.h"

@interface ViewControllerTheSecond ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePhotoView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *occupationLabel;
@property (weak, nonatomic) IBOutlet UILabel *educationLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewControllerTheSecond

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view removeConstraints:self.view.constraints];

    NSDictionary *viewsDictionary = @{ @"profilePhotoView": self.profilePhotoView,
                                       @"nameLabel": self.nameLabel,
                                       @"occupationLabel": self.occupationLabel,
                                       @"educationLabel": self.educationLabel,
                                       @"containerView": self.containerView };

    for(UIView *view in viewsDictionary.allValues) {
        [self prepareViewForAutolayout:view];
    }


    NSArray *row1Constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[profilePhotoView(==150)]-[nameLabel]-|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:viewsDictionary];
    [self.containerView addConstraints:row1Constraints];

    NSArray *row2Constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[profilePhotoView]-[occupationLabel]-|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:viewsDictionary];
    [self.containerView addConstraints:row2Constraints];

    NSArray *row3Constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[profilePhotoView]-[educationLabel]-|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:viewsDictionary];
    [self.containerView addConstraints:row3Constraints];


    NSLayoutConstraint *boxHeightConstraint = [NSLayoutConstraint constraintWithItem:self.profilePhotoView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.profilePhotoView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
     [self.containerView addConstraint:boxHeightConstraint];

    NSArray *firstColumnConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[profilePhotoView]" options:0 metrics:nil views:viewsDictionary];
    [self.containerView addConstraints:firstColumnConstraints];


    NSArray *secondColumnConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[nameLabel]-[occupationLabel(==nameLabel)]-[educationLabel(==nameLabel)]-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewsDictionary];

    [self.containerView addConstraints:secondColumnConstraints];


    NSArray *containerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[containerView]-|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:containerConstraints];

//    NSArray *vContainerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[containerView(==profilePhotoView)]" options:0 metrics:nil views:viewsDictionary];
//    [self.view addConstraints:vContainerConstraintns];

    NSLayoutConstraint *jankConstraint = [NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.profilePhotoView attribute:NSLayoutAttributeBottom multiplier:1 constant:8];
    [self.containerView addConstraint:jankConstraint];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)prepareViewForAutolayout:(UIView *)view
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view removeConstraints:view.constraints];
}

@end
