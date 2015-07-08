//
//  Merchandise.h
//  CoreDataIntro
//
//  Created by Timothy Clem on 6/25/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tag;

@interface Merchandise : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int64_t priceInCents;
@property (nonatomic, retain) NSString * rating;
@property (nonatomic, retain) NSSet *tags;
@end

@interface Merchandise (CoreDataGeneratedAccessors)

- (void)addTagsObject:(Tag *)value;
- (void)removeTagsObject:(Tag *)value;
- (void)addTags:(NSSet *)values;
- (void)removeTags:(NSSet *)values;

@end
