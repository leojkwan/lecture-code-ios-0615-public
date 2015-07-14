//
//  FISGithubAPIClient.m
//  github-repo-list
//
//  Created by Joe Burgess on 5/5/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISGithubAPIClient.h"
#import "FISConstants.h"
#import <AFNetworking.h>

NSString *const GITHUB_API_URL = @"https://api.github.com";


@implementation FISGithubAPIClient

+(void)getRepositoriesWithCompletion:(void (^)(NSArray *))completionBlock
{
    NSString *githubURL = [NSString stringWithFormat:@"%@/repositories?client_id=%@&client_secret=%@",GITHUB_API_URL, GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager GET:githubURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Fail: %@",error.localizedDescription);
    }];
}

+(NSURL *)urlForStarredRepositoryNamed:(NSString *)repoName
{
    NSString *starURLString = [NSString stringWithFormat:@"%@/user/starred/%@?client_id=%@&client_secret=%@&access_token=%@", GITHUB_API_URL, repoName, GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET, GITHUB_ACCESS_TOKEN];

    return [NSURL URLWithString:starURLString];
}

//+(void)getStarStatusForRepositoryNamed:(NSString *)repoName
//                            completion:(void (^)(BOOL))completionBlock
//{
//    NSURL *starURL = [FISGithubAPIClient urlForStarredRepositoryNamed:repoName];
//
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithURL:starURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//
//        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//        if(httpResponse.statusCode == 204) {
//            // We starred this repo
//            completionBlock(YES);
//        }
//        else if(httpResponse.statusCode == 404) {
//            // We have not starred this repo
//            completionBlock(NO);
//        }
//
//        // hopefully this never happens...
//    }];
//
//    [task resume];
//}

+(void)getStarStatusForRepositoryNamed:(NSString *)repoName
                            completion:(void (^)(BOOL))completionBlock
{
    NSString *starURLString = [NSString stringWithFormat:@"%@/user/starred/%@", GITHUB_API_URL, repoName];

    NSDictionary *params = @{ @"access_token": @"f7f0f589466a7953f34491461619a82bf80711ea" };

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:starURLString parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        // 204 == we starred that repo
//        NSHTTPURLResponse *actualFreakingResponse = (NSHTTPURLResponse *)task.response;
//        if(actualFreakingResponse.statusCode == 204) {
        NSLog(@"Success!");
        completionBlock(YES);
//        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSHTTPURLResponse *actualFreakingResponse = (NSHTTPURLResponse *)task.response;
        if(actualFreakingResponse.statusCode == 404) {
            NSLog(@"Fake failure. 404. Error: %@", error);
            completionBlock(NO);
        }
        else {
            NSLog(@"Real actual failure! %@", error);
//            completionBlock(NO);
        }
    }];
}

+(void)starRepositoryNamed:(NSString *)repoName
                completion:(void (^)(BOOL))completionBlock
{
    NSURL *starURL = [FISGithubAPIClient urlForStarredRepositoryNamed:repoName];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:starURL];
    request.HTTPMethod = @"PUT";

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 204) {
            // We starred this repo
            completionBlock(YES);
        }
        else {
            completionBlock(NO);
        }
    }];

    [task resume];
}

+(void)unstarRepositoryNamed:(NSString *)repoName
                  completion:(void (^)(BOOL))completionBlock
{
    NSURL *starURL = [FISGithubAPIClient urlForStarredRepositoryNamed:repoName];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:starURL];
    request.HTTPMethod = @"DELETE";

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 204) {
            // We starred this repo
            completionBlock(YES);
        }
        else {
            completionBlock(NO);
        }
    }];

    [task resume];
}

+(void)toggleStarForRepositoryNamed:(NSString *)repoName
                         completion:(void (^)(BOOL))completionBlock
{
    // Check if the repo is starred.
    // If it is, unstar. Call back with NO.
    // If it isn't, star. Call back with YES.

    NSLog(@"Checking if %@ is starred.", repoName);
    [FISGithubAPIClient getStarStatusForRepositoryNamed:repoName completion:^(BOOL isStarred) {
        if(isStarred) {
            NSLog(@"%@ is starred. Unstarring it...", repoName);
            // Currently starred. Unstar it.
            [FISGithubAPIClient unstarRepositoryNamed:repoName completion:^(BOOL didUnstar) {
                NSLog(@"Unstarred %@. Calling back!", repoName);
                completionBlock(NO);
            }];
        }
        else {
            // Current unstarred. Star it.
            [FISGithubAPIClient starRepositoryNamed:repoName completion:^(BOOL didStar) {
                NSLog(@"Starred %@. Calling back!", repoName);
                completionBlock(YES);
            }];
        }
    }];
}

+(void)searchRepositoriesWithQuery:(NSString *)query completion:(void (^)(NSArray *))completionBlock
{
    // https://api.github.com/search/repositories?access_token=f7f0f589466a7953f34491461619a82bf80711ea&q=tetris

    NSDictionary *params = @{ @"access_token": @"f7f0f589466a7953f34491461619a82bf80711ea",
                              @"q": query };

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.github.com/search/repositories" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {

        NSLog(@"URL it hit: %@", task.originalRequest.URL);
//        NSLog(@"Success: %@", responseObject);

        NSDictionary *responseDict = responseObject;
        completionBlock(responseDict[@"items"]);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
