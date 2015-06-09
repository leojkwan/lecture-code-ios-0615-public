//
//  FISPlane.h
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISVehicle.h"

@interface FISPlane : FISVehicle

@property (nonatomic) CGFloat currentAltitude;
@property (nonatomic) CGFloat topAltitude;

-(void)increaseAltitude;

@end
