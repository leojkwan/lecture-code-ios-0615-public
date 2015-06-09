//
//  FISVehicle.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISVehicle.h"

@implementation FISVehicle

-(instancetype)initWithWeight:(CGFloat)weight
                     topSpeed:(CGFloat)topSpeed
                 currentSpeed:(CGFloat)currentSpeed
             currentDirection:(CGFloat)currentDirection
{
    self = [super init];

    if(self) {
        _weight = weight;
        _topSpeed = topSpeed;
        _currentSpeed = currentSpeed;
        _currentDirection = currentDirection;
    }

    return self;
}

-(instancetype)init
{
    self = [self initWithWeight:0
                       topSpeed:0
                   currentSpeed:0
               currentDirection:0];

    return self;
}

-(void)increaseSpeed
{
    self.currentSpeed = self.topSpeed;
}

-(void)turnLeft
{
    CGFloat adjustedDirection = self.currentDirection - 90.0;

    if(adjustedDirection < 0.0) {
        adjustedDirection += 360.0;
    }

    self.currentDirection = adjustedDirection;
}


@end
