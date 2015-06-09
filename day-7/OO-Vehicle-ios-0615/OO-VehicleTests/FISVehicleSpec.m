//
//  FISVehicleSpec.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/4/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISVehicle.h"
#define EXP_SHORTHAND
#import "Expecta.h"


SpecBegin(FISVehicle)

describe(@"FISVehicle", ^{
    __block FISVehicle *vehicle;
    
    beforeEach(^{
        vehicle = [[FISVehicle alloc] initWithWeight:0.0f topSpeed:0.0f currentSpeed:0.0f currentDirection:0.0f];
    });
    
//    properties
    it(@"is an FISVehicle", ^{
        expect(vehicle).toNot.beNil();
        expect(vehicle).to.beInstanceOf([FISVehicle class]);
    });
    
    it(@"has a weight", ^{
        expect(vehicle).to.respondTo(@selector(weight));
        expect(vehicle).to.respondTo(@selector(setWeight:));
        expect(vehicle.weight).to.equal(0.0f);
    });
    
    it(@"has a top speed", ^{
        expect(vehicle).to.respondTo(@selector(topSpeed));
        expect(vehicle).to.respondTo(@selector(setTopSpeed:));
        expect(vehicle.weight).to.equal(0.0f);
    });

    it(@"has a current speed", ^{
        expect(vehicle).to.respondTo(@selector(currentSpeed));
        expect(vehicle).to.respondTo(@selector(setCurrentSpeed:));
        expect(vehicle.currentSpeed).to.equal(0.0f);
    });
    
    it(@"has a current direction", ^{
        expect(vehicle).to.respondTo(@selector(currentDirection));
        expect(vehicle).to.respondTo(@selector(setCurrentDirection:));
        expect(vehicle.currentDirection).to.equal(0.0f);
    });
    
//    methods
    it(@"can increase speed", ^{
        [vehicle increaseSpeed];
        expect([vehicle currentSpeed]).to.equal([vehicle topSpeed]);
    });
    
    it(@"can brake", ^{
        [vehicle brake];
        expect([vehicle currentSpeed]).to.equal(0.0f);
    });
    
    
    describe(@"turnLeft", ^{
        it(@"can turn left", ^{
            [vehicle turnLeft];
            expect([vehicle currentDirection]).to.equal(270.0f);
        });
        
        it(@"can turn left 360 degrees", ^{
            for(int x = 0; x < 4; x++)
           {
               [vehicle turnLeft];
           }
            expect([vehicle currentDirection]).to.equal(0.0f);
        });
        
    });
    
    describe(@"turnRight", ^{
        it(@"can turn right", ^{
            [vehicle turnRight];
            expect([vehicle currentDirection]).to.equal(90.0f);
        });
        
        it(@"can turn right 360 degrees", ^{
            for(int x = 0; x < 4; x++)
            {
                [vehicle turnRight];
            }
            expect([vehicle currentDirection]).to.equal(0.0f);
        });
    });
    
});

SpecEnd
