//
//  Mammal.m
//  OOInheritance
//
//  Created by Timothy Clem on 6/8/15.
//  Copyright (c) 2015 flatiron. All rights reserved.
//

#import "Mammal.h"

@implementation Mammal

-(instancetype)init
{
    self = [super init];
    if(self) {
        _doesLayEggs = NO;
        _hairColor = @"brown";
    }

    return self;
}

-(void)sayHello
{
    NSLog(@"A hairy hello from a mammal!");
}

@end
