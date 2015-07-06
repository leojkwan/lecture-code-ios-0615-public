//
//  FISViewController.m
//  TouchesAndGestures
//
//  Created by Timothy Clem on 7/6/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@property (nonatomic, assign) CGPoint previousPoint;

@end


@implementation FISViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

//    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                                    action:@selector(imageViewTapped)];
//
////    tapRecognizer.numberOfTapsRequired = 3;
//    tapRecognizer.numberOfTouchesRequired = 2;
//    [self.imageView addGestureRecognizer:tapRecognizer];

    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(imageViewPanned:)];

    [self.imageView addGestureRecognizer:panRecognizer];
}

-(void)imageViewPanned:(UIPanGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:self.view];

    if(recognizer.state == UIGestureRecognizerStateBegan) {
        self.previousPoint = point;
        return;
    }

//    NSLog(@"%@", NSStringFromCGPoint(point));

    // Calculate how far the new point is from the old one (delta)
    // Adjust the constants on the constraints appropriately

    CGFloat deltaX = point.x - self.previousPoint.x;
    CGFloat deltaY = point.y - self.previousPoint.y;

//    NSLog(@"previous point: %@, current point: %@, delta: %@", NSStringFromCGPoint(self.previousPoint), NSStringFromCGPoint(point), NSStringFromCGPoint(CGPointMake(deltaX, deltaY)));

    self.leftConstraint.constant += deltaX;
    self.topConstraint.constant += deltaY;

    self.previousPoint = point;

    NSLog(@"%@", NSStringFromCGPoint([recognizer velocityInView:self.view]));
    if(recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:self.view];

        [UIView animateWithDuration:0.5 animations:^{
            self.leftConstraint.constant += velocity.x;
            self.topConstraint.constant += velocity.y;

            [self.view layoutIfNeeded];
        }];
    }
}

-(IBAction)labelLongPressed:(UILongPressGestureRecognizer *)sender
{
    NSLog(@"you long pressed on the label!");
}

//-(void)imageViewTapped
//{
//    NSLog(@"Image view tapped");
//}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
