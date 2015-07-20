//
//  ViewController.m
//  ViewsInCode
//
//  Created by Timothy Clem on 7/19/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import "FISUser.h"
#import <AFNetworking/UIKit+AFNetworking.h>
#import <AFNetworking/AFNetworking.h>
#import "FISUserProfileView.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *profileContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *profileImageSpinner;

@property (weak, nonatomic) IBOutlet FISUserProfileView *profileView;
@property (strong, nonatomic) FISUserProfileView *secondProfileView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    FISUser *user = [[FISUser alloc] init];
    user.name = @"Capt. Stompers";
    user.profileImageURL = [NSURL URLWithString:@"http://placehold.it/300x300"];


//    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:user.profileImageURL];
//    [self.profileImageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//        self.profileImageView.image = image;
//        [self.profileImageSpinner stopAnimating];
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
//        [self.profileImageSpinner stopAnimating];
//    }];
//
//    self.profileNameLabel.text = user.name;
//    self.profileImageView.layer.borderWidth = 1;
//    self.profileImageView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.25].CGColor;



    self.profileView.user = user;


    FISUser *user2 = [[FISUser alloc] init];
    user2.name = @"Lt. Fluffy";
    user2.profileImageURL = [NSURL URLWithString:@"http://placehold.it/350x350"];

    self.secondProfileView = [[FISUserProfileView alloc] init];
    [self.view addSubview:self.secondProfileView];
    [self.secondProfileView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(@0);
        make.width.equalTo(@200);
        make.height.equalTo(@450);
    }];


    self.secondProfileView.user = user2;



    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"My title" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(@0);
        make.width.and.height.equalTo(@100);
    }];

    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonTapped:(UIButton *)sender
{
    [sender setTitle:@"You tapped me!" forState:UIControlStateNormal];
}

@end
