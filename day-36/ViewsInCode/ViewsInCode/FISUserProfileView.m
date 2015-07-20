//
//  FISUserProfileView.m
//  ViewsInCode
//
//  Created by Timothy Clem on 7/20/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISUserProfileView.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/UIKit+AFNetworking.h>


@interface FISUserProfileView ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@end


@implementation FISUserProfileView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if(self) {
        [self commonInit];
    }

    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if(self) {
        [self commonInit];
    }

    return self;
}

-(void)setUser:(FISUser *)user
{
    _user = user;

    [self updateUI];
}

-(void)updateUI
{
    self.nameLabel.text = self.user.name;

    [self.spinner startAnimating];

    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:self.user.profileImageURL];
    [self.imageView setImageWithURLRequest:imageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        self.imageView.image = image;
        [self.spinner stopAnimating];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [self.spinner stopAnimating];
    }];
}

-(void)commonInit
{
    self.backgroundColor = [UIColor lightGrayColor];


    // Image View
    self.imageView = [[UIImageView alloc] init];
    [self addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor redColor];

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(@0);
        make.width.equalTo(self);
        make.height.equalTo(self.imageView.mas_width);
    }];

    // Spinner
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.spinner.hidesWhenStopped = YES;
    [self.spinner startAnimating];
    [self addSubview:self.spinner];
    [self.spinner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.imageView);
    }];


    // Label
    self.nameLabel = [[UILabel alloc] init];

    [self addSubview:self.nameLabel];

    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).with.offset(8);
        make.left.equalTo(@0);
        make.width.equalTo(self);
    }];
}

@end
