//
//  FISCarSpec.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISCar.h"
#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(FISCar)

describe(@"FISCar", ^{
    __block FISCar *car;
    
    beforeEach(^{
        car = [[FISCar alloc] init];
    });
    
    it(@"is an FISVehicle", ^{
        expect(car).notTo.beNil();
        expect(car).to.beInstanceOf([FISCar class]);
    });  
    
    it(@"is a subclass of FISVehicle", ^{
        expect([car class]).to.beSubclassOf([FISVehicle class]);
    });
    
    it(@"has a weight of 1270", ^{
        expect(car.weight).to.equal(1270.0f);
    });
    
    it(@"has a top speed of 88", ^{
        expect(car.topSpeed).to.equal(88.0f);
    });
    
    it(@"has a current speed of 0",^{
        expect(car.currentSpeed).to.equal(0.0f);
    });
    
    it(@"has a current direction of 0 (north)",^{
        expect(car.currentDirection).to.equal(0.0f);
    });
});

SpecEnd
