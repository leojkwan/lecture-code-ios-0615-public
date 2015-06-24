//
//  DataManager.m
//  CoreDataIntro
//
//  Created by Timothy Clem on 6/24/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+(instancetype)sharedManager
{
    static DataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });

    return _sharedManager;
}

-(instancetype)init
{
    self = [super init];
    if(self) {
        self.shoppingCart = [[NSMutableArray alloc] init];
    }

    return self;
}

@end
