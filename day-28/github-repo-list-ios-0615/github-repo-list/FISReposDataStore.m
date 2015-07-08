//
//  FISReposDataStore.m
//  github-repo-list
//
//  Created by Tom OMalley on 7/6/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISReposDataStore.h"
#import "FISGithubAPIClient.h"
#import "FISGithubRepository.h"

@implementation FISReposDataStore

+ (instancetype)sharedDataStore {
    static FISReposDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[FISReposDataStore alloc] init];
    });
    
    return _sharedDataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _repositories = [NSMutableArray new];
    }
    return self;
}

-(void)fetchRepositoriesWithCompletion:(void (^)(BOOL))block
{
    // use the api client method to get the array of dictionaries
    // turn those dictionaries into FISGithubRepository objects
    // stash those new objects on self.repositories
    // call back with YES (or NO... eventually)

    FISGithubAPIClient *apiClient = [[FISGithubAPIClient alloc] init];
    [apiClient getRepositoriesWithCompletion:^(NSArray *repositories) {
        // build up an array of the modelified repos
        [self.repositories removeAllObjects];

        for(NSDictionary *repoDict in repositories) {
            FISGithubRepository *repo = [[FISGithubRepository alloc] initWithDictionary:repoDict];
            [self.repositories addObject:repo];
        }

        block(YES);
    }];
}

@end
