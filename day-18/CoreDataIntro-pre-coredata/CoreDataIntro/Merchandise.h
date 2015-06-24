//
//  Merchandise.h
//  CoreDataIntro
//
//  Created by Timothy Clem on 6/24/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Merchandise : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *review;
@property (nonatomic, assign) NSUInteger priceInCents;

@property (nonatomic, readonly) NSString *formattedPrice;

@end
