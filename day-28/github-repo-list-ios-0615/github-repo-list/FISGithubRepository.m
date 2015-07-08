//
//  FISGithubRepository.m
//  ReviewSession 3-16-14
//
//  Created by Joe Burgess on 3/16/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISGithubRepository.h"

@implementation FISGithubRepository

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];

    if(self) {
        _fullName = dictionary[@"full_name"];

        _repositoryID = [dictionary[@"id"] stringValue];

        NSString *urlString = dictionary[@"html_url"];
        _htmlURL = [NSURL URLWithString:urlString];
    }

    return self;
}

-(BOOL)isEqual:(id)object
{
    if(![object isKindOfClass:[FISGithubRepository class]]) {
        return NO;
    }

    FISGithubRepository *otherRepo = object;
    return [self.repositoryID isEqual:otherRepo.repositoryID];
}

@end
