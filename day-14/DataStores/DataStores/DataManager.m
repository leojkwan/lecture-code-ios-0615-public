//
//  DataManager.m
//  DataStores
//
//  Created by Timothy Clem on 6/18/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

-(instancetype)init
{
    self = [super init];

    if(self) {
        _shoppingList = [[NSMutableArray alloc] init];
    }

    return self;
}

+(instancetype)sharedDataManager
{
    static DataManager *_sharedDataManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataManager = [[DataManager alloc] init];

//        _sharedDataManager.shoppingList = @[ @"bananas" ];
    });

    return _sharedDataManager;
}

@end
