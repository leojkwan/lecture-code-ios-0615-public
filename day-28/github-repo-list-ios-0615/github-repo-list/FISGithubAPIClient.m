//
//  FISGithubAPIClient.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISGithubAPIClient.h"

@implementation FISGithubAPIClient

-(void)getRepositoriesWithCompletion:(void (^)(NSArray *))block
{
    NSURLSession *urlSession = [NSURLSession sharedSession];

    NSString *urlString = @"https://api.github.com/repositories?client_id=fbfb11ed462f0be0f462&client_secret=b6803370e510dd46fa4f55a6fe718ed7b1cc0da0";
 
    NSURL *url = [NSURL URLWithString:urlString];

    NSLog(@"before the dataTaskWithURL call");
    NSURLSessionDataTask *task = [urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *repositories = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"In the method's completion block. Response: %@", repositories);

        block(repositories);

        // check for an error
        // deserialize the data to an array
        // turn the dicts in the array into models
        // call back the block with the array of models
    }];
    NSLog(@"after the dataTaskWithURL call");

    [task resume];
}

@end
