//
//  FISCar.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCar.h"

@implementation FISCar

-(instancetype)init
{
    self = [super initWithWeight:1270
                        topSpeed:88
                    currentSpeed:0
                currentDirection:0];

    return self;
}

@end
