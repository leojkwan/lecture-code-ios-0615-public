//
//  ViewController.m
//  PlayingWithNibs
//
//  Created by Timothy Clem on 7/21/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import "FISUser.h"
#import <AFNetworking/UIKit+AFNetworking.h>
#import "FISUserProfileView.h"
#import <Masonry/Masonry.h>
#import "OldStyleViewController.h"

@interface ViewController ()

//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
//@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
//    UINib *theNib = [UINib nibWithNibName:@"ProfileView" bundle:nil];
//
//    NSArray *topLevelObjects = [theNib instantiateWithOwner:self options:nil];
//    UIView *profileView = topLevelObjects[0];
//
//    [self.view addSubview:profileView];
//
//
//
    FISUser *user = [[FISUser alloc] init];
    user.name = @"Capt. Stompers";
    user.profileImageURL = [NSURL URLWithString:@"http://placehold.it/300x300"];
//
//
//    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:user.profileImageURL];
//    [self.imageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//        self.imageView.image = image;
//        [self.spinner stopAnimating];
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
//        [self.spinner stopAnimating];
//    }];
//    
//    self.nameLabel.text = user.name;
//    self.imageView.layer.borderWidth = 1;
//    self.imageView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.25].CGColor;


    FISUserProfileView *profileView = [[FISUserProfileView alloc] init];
    [self.view addSubview:profileView];

    [profileView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(@0);
        make.width.equalTo(self.view).dividedBy(2);
        make.height.equalTo(self.view).dividedBy(3);
    }];

    profileView.user = user;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    OldStyleViewController *oldStyleVC = [[OldStyleViewController alloc] init];

    [self presentViewController:oldStyleVC animated:YES completion:nil];
}

@end
