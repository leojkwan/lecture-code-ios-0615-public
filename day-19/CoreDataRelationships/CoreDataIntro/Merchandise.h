//
//  Merchandise.h
//  CoreDataIntro
//
//  Created by Timothy Clem on 6/24/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Merchandise : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int64_t priceInCents;
@property (nonatomic, retain) NSString * rating;
@property (nonatomic, retain) NSString * category;

@end
