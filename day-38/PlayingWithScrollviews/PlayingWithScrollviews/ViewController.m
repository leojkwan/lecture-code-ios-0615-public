//
//  ViewController.m
//  PlayingWithScrollviews
//
//  Created by Timothy Clem on 7/22/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController () <UIScrollViewDelegate>

//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *leftBar;
@property (strong, nonatomic) MASConstraint *leftBarLeftConstraint;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self.contentView removeConstraints:self.contentView.constraints];
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(@0);
//        make.width.equalTo(@2000);
//    }];


    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(@50);
        make.width.and.height.equalTo(@300);
    }];

    scrollView.delegate = self;
//    scrollView.maximumZoomScale = 5;


    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sprite"]];
    [scrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
        make.width.equalTo(scrollView.mas_width).multipliedBy(3);
        make.height.equalTo(scrollView);
    }];

    self.leftBar = [[UIView alloc] init];
    self.leftBar.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:self.leftBar];
    [self.leftBar mas_makeConstraints:^(MASConstraintMaker *make) {
        self.leftBarLeftConstraint = make.left.equalTo(@0);
        make.top.and.bottom.equalTo(@0);
        make.width.equalTo(@50);
    }];

//    NSArray *imagesForPages = @[ [UIImage imageNamed:@"boy"],
//                                 [UIImage imageNamed:@"girl"],
//                                 [UIImage imageNamed:@"sprite"] ];
//
//    id leftConstraintSource = contentView.mas_left;
//    for(UIImage *pageImage in imagesForPages) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:pageImage];
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
//
//        [contentView addSubview:imageView];
//        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(contentView);
//            make.width.equalTo(scrollView);
//            make.top.equalTo(@0);
//
//            make.left.equalTo(leftConstraintSource);
//        }];
//
//        leftConstraintSource = imageView.mas_right;
//    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint contentOffset = scrollView.contentOffset;
    CGSize contentViewSize = self.contentView.frame.size;

    CGFloat xOffsetForFinalPage = contentViewSize.width - scrollView.frame.size.width;
    CGFloat percentToFarRight = contentOffset.x / xOffsetForFinalPage;

    if(percentToFarRight < 0) {
        percentToFarRight = 0;
    }

    NSLog(@"%.3f", percentToFarRight);
//    self.contentView.alpha = percentToFarRight;

    // goal: constant of the left constraint for the left bar gets updated to be the x contentOffset
    if(contentOffset.x >= 0) {
        self.leftBarLeftConstraint.offset(contentOffset.x);
    }
}

//-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    return self.contentView;
//}

@end
