//
//  FISReposDataStore.h
//  github-repo-list
//
//  Created by Joe Burgess on 5/5/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISGithubRepository.h"

@interface FISReposDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *repositories;

+ (instancetype)sharedDataStore;

-(void)getRepositoriesWithCompletion:(void (^)(BOOL success))completionBlock;
-(void)searchForRepositoriesWithQuery:(NSString *)query completion:(void (^)(BOOL success))completionBlock;


@end
