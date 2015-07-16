//
//  ViewController.m
//  PlayingWithNSOperationQueue
//
//  Created by Timothy Clem on 7/16/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label0;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for(NSUInteger i = 0; i < 10000; i++) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.label2.text = [NSString stringWithFormat:@"%lu", i];
            });
        }
    });

}

- (void)viewDidLoadjlhglj {
    [super viewDidLoad];

    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    operationQueue.maxConcurrentOperationCount = 2;

    NSBlockOperation *label0Operation = [NSBlockOperation blockOperationWithBlock:^{
//do a bunch of stuff


        for(NSUInteger i = 0; i < 10000; i++) {
            NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
            [mainQueue addOperationWithBlock:^{
                self.label0.text = [NSString stringWithFormat:@"%lu", i];
            }];

            //            [NSThread sleepForTimeInterval:0.5];
        }
    }];

    NSBlockOperation *label1Operation = [NSBlockOperation blockOperationWithBlock:^{
        for(NSUInteger i = 0; i < 10000; i++) {
            NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
            [mainQueue addOperationWithBlock:^{
                self.label1.text = [NSString stringWithFormat:@"%lu", i];
            }];

            //            [NSThread sleepForTimeInterval:0.5];
        }
    }];

    NSBlockOperation *label2Operation = [NSBlockOperation blockOperationWithBlock:^{
        for(NSUInteger i = 0; i < 10000; i++) {
            NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
            [mainQueue addOperationWithBlock:^{
                self.label2.text = [NSString stringWithFormat:@"%lu", i];
            }];

            //            [NSThread sleepForTimeInterval:0.5];
        }
    }];

    [label2Operation addDependency:label1Operation];
    [label2Operation addDependency:label0Operation];

    [operationQueue addOperation:label0Operation];
    [operationQueue addOperation:label1Operation];
    [operationQueue addOperation:label2Operation];

//    [operationQueue addOperationWithBlock:^{
//        for(NSUInteger i = 0; i < 10000; i++) {
//            NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
//            [mainQueue addOperationWithBlock:^{
//                self.label2.text = [NSString stringWithFormat:@"%lu", i];
//            }];
//
//            //            [NSThread sleepForTimeInterval:0.5];
//        }
//    }];

//    NSLog(@"before loop");
//    for(NSUInteger i = 0; i < 1000000; i++) {
//        self.label1.text = [NSString stringWithFormat:@"%lu", i];
//    }
//    NSLog(@"after loop");
}

//-(void)doSomething:(void (^)(void))block
//{
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//        block();
//    }];
//}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

//    NSLog(@"in viewWillAppear");
//    NSLog(@"before loop");
//    for(NSUInteger i = 0; i < 10000000; i++) {
//        self.label1.text = [NSString stringWithFormat:@"%lu", i];
//    }
//    NSLog(@"after loop");
}

@end
