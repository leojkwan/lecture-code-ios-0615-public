//
//  Person.h
//  ObjectOrientedPeople
//
//  Created by Timothy Clem on 6/8/15.
//  Copyright (c) 2015 al-tyus.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic) NSUInteger height;
@property (nonatomic) NSUInteger age;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *friends;

@property (nonatomic) BOOL isFemale;

-(void)grow;

@end
