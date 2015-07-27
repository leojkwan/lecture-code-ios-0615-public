//
//  ViewController.m
//  PlayingWithNSError
//
//  Created by Timothy Clem on 7/24/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSString *s = @"hi!";
//    [self changeThisStringToHello:&s];
//    NSLog(@"s after method in viewDidLoad: %@", s);

    NSString *badJSON = @"{ a: 2 }";

    NSData *jsonData = [badJSON dataUsingEncoding:NSUTF8StringEncoding];

    NSError *error = nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

    if(jsonObject) {
        NSLog(@"Success! JSON object: %@", jsonObject);
    }
    else {
//        if([error.domain isEqualToString:NSURLErrorDomain] && error.code == NSURLErrorNotConnectedToInternet) {
//            // this is the case of the internet being down; do whatever!
//
//        }

        if([error.domain isEqualToString:NSCocoaErrorDomain] && error.code == NSPropertyListReadCorruptError /* FIND THE CONSTANT FOR THIS DON'T HARDCODE THINGS AAAAAH */) {
            NSLog(@"Invalid JSON!");
        }

        NSLog(@"Failure! Error: %@", error);
    }
}

-(void)changeThisStringToHello:(NSString **)string
{
    *string = @"hello";
    NSLog(@"string at end of method: %@", *string);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
