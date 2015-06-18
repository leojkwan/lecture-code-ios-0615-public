//
//  DataManager.h
//  DataStores
//
//  Created by Timothy Clem on 6/18/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property (nonatomic, strong) NSMutableArray *shoppingList;

+(instancetype)sharedDataManager;

@end
