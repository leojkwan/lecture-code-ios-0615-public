//
//  ViewController.m
//  PostingToGithub
//
//  Created by Timothy Clem on 7/9/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

NSString * const GithubClientID = @"fbfb11ed462f0be0f462";
NSString * const GithubClientSecret = @"b6803370e510dd46fa4f55a6fe718ed7b1cc0da0";
NSString * const GithubAccessToken = @"f7f0f589466a7953f34491461619a82bf80711ea";


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/repos/learn-co-students/lecture-code-ios-0615/issues?client_id=%@&client_secret=%@&access_token=%@",
                           GithubClientID, GithubClientSecret, GithubAccessToken];

    NSURL *url = [NSURL URLWithString:urlString];

    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"%@", repos);
//    }];


    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";

    NSDictionary *params = @{ @"title": @"Hello from Obj-C" };
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", responseDict);
    }];

    [task resume];
}

@end
