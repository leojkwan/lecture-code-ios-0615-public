//
//  Item.m
//  OOStuff
//
//  Created by Timothy Clem on 6/5/15.
//  Copyright (c) 2015 flatiron. All rights reserved.
//

#import "Item.h"

@implementation Item

-(instancetype)init
{
//    self = [super init];
//
//    if(self) {
//        _colors = [[NSMutableArray alloc] init];
//    }
//
//    return self;

    self = [self initWithName:@"New Item"];
    return self;
}

-(instancetype)initWithName:(NSString *)name
{
//    self = [super init];
//
//    if(self) {
//        _name = name;
//        _colors = [[NSMutableArray alloc] init];
//    }
//
//    return self;

    self = [self initWithName:name price:1.0];
    return self;
}

-(instancetype)initWithName:(NSString *)name price:(CGFloat)price
{
    self = [super init];

    if(self) {
        _name = name;
        _price = price;
        _colors = [[NSMutableArray alloc] init];
    }

    return self;
}

@end
