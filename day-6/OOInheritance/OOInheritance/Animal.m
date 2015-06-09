//
//  Animal.m
//  OOInheritance
//
//  Created by Timothy Clem on 6/8/15.
//  Copyright (c) 2015 flatiron. All rights reserved.
//

#import "Animal.h"

@implementation Animal

-(instancetype)init
{
    self = [super init];

    if(self) {
        _commonName = @"Some animal";
    }

    return self;
}

-(void)sayHello
{
    NSLog(@"Hello! I'm just a normal animal");
}

@end
