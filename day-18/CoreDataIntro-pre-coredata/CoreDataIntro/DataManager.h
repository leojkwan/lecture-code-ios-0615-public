//
//  DataManager.h
//  CoreDataIntro
//
//  Created by Timothy Clem on 6/24/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+(instancetype)sharedManager;

@property (nonatomic, strong) NSMutableArray *shoppingCart;

@end
