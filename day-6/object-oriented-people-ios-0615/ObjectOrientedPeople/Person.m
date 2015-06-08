//
//  Person.m
//  ObjectOrientedPeople
//
//  Created by Timothy Clem on 6/8/15.
//  Copyright (c) 2015 al-tyus.com. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)init
{
    self = [super init];

    if(self) {
        _friends = [[NSMutableArray alloc] init];
    }

    return self;
}

-(void)grow
{
    /*
     If it's a girl with age < 11 grow between 0 and 1 inch, age >= 11 and <=15 grow .5 to 2 inches. >15 grow 0 inches */

    if(self.isFemale) {
        if(self.age < 11) {
            self.height += [self randomFloatBetweenNumber:0 andNumber:1];
        }
        else if(self.age <= 15)
        {
            // ..
        }
    }
    else {

    }
}

- (CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((CGFloat)arc4random() / 0x100000000) * (maxRange - minRange) + minRange;
}

@end
