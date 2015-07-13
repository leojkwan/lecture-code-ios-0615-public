//
//  ViewController.m
//  AFNetworkingIntro
//
//  Created by Timothy Clem on 7/13/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

//    NSDictionary *authParams = @{ @"access_token": @"f7f0f589466a7953f34491461619a82bf80711ea" };

//    [manager GET:@"https://api.github.com/repos/learn-co-students/lecture-code-ios-0615/issues" parameters:authParams success:^(NSURLSessionDataTask *task, id responseObject) {
//
//        NSLog(@"URL that it hit: %@", task.originalRequest.URL);
//
//        NSArray *issueDictionaries = responseObject;
//        NSLog(@"%@", issueDictionaries);
//
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//
//        NSLog(@"Error: %@", error.localizedDescription);
//
//    }];

    manager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
    [manager.requestSerializer setValue:@"token f7f0f589466a7953f34491461619a82bf80711ea"
                     forHTTPHeaderField:@"Authorization"];

    NSDictionary *params = @{ @"title": @"hello from AFNetworking" };

    [manager POST:@"https://api.github.com/repos/learn-co-students/lecture-code-ios-0615/issues" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {

        NSLog(@"URL that it hit: %@", task.originalRequest.URL);

        NSArray *issueDictionaries = responseObject;
        NSLog(@"%@", issueDictionaries);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        NSLog(@"Body of the request: %@", [[NSString alloc] initWithData:task.originalRequest.HTTPBody encoding:NSUTF8StringEncoding]);

        NSLog(@"Error: %@", error.localizedDescription);
        
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
