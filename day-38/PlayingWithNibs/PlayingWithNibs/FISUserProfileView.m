//
//  FISUserProfileView.m
//  PlayingWithNibs
//
//  Created by Timothy Clem on 7/21/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISUserProfileView.h"
#import <AFNetworking/UIKit+AFNetworking.h>
#import <Masonry/Masonry.h>

@interface FISUserProfileView ()

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *spinner;

@end


@implementation FISUserProfileView

// load the nib
// somehow deal with the outlets
// refresh UI on -setUser:

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self commonInit];
    }

    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self commonInit];
    }

    return self;
}

-(void)commonInit
{
    self.backgroundColor = [UIColor redColor];

    self.clipsToBounds = YES;

    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class)
                                  owner:self
                                options:nil];

    [self addSubview:self.containerView];

    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
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

@end
