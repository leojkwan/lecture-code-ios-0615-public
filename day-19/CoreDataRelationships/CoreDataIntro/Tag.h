//
//  Tag.h
//  CoreDataIntro
//
//  Created by Timothy Clem on 6/25/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Merchandise;

@interface Tag : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSSet *merchandise;
@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)addMerchandiseObject:(Merchandise *)value;
- (void)removeMerchandiseObject:(Merchandise *)value;
- (void)addMerchandise:(NSSet *)values;
- (void)removeMerchandise:(NSSet *)values;

@end
