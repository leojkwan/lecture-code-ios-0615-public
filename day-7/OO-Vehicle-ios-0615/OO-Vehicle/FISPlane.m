//
//  FISPlane.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISPlane.h"

@implementation FISPlane

-(instancetype)init
{
    self = [self initWithWeight:255000
                       topSpeed:614
                   currentSpeed:0
               currentDirection:0];

    return self;
}

-(CGFloat)defaultWeight
{
    return 255000;
}

-(instancetype)initWithWeight:(CGFloat)weight topSpeed:(CGFloat)topSpeed currentSpeed:(CGFloat)currentSpeed currentDirection:(CGFloat)currentDirection
{
    self = [self initWithWeight:weight topSpeed:topSpeed currentSpeed:currentSpeed currentDirection:currentDirection topAltitude:30000 currentAltitude:0];

    return self;
}

-(instancetype)initWithWeight:(CGFloat)weight
                     topSpeed:(CGFloat)topSpeed
                 currentSpeed:(CGFloat)currentSpeed
             currentDirection:(CGFloat)currentDirection
                  topAltitude:(CGFloat)topAltitude
              currentAltitude:(CGFloat)currentAltitude
{
    self = [super initWithWeight:weight topSpeed:topSpeed currentSpeed:currentSpeed currentDirection:currentDirection];

    if(self) {
        _topAltitude = topAltitude;
        _currentAltitude = currentAltitude;
    }

    return self;
}

@end
