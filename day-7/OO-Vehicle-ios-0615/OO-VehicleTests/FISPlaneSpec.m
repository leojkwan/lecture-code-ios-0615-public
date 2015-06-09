//
//  FISPlaneSpec.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISPlane.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISVehicle.h"

SpecBegin(FISPlane)

describe(@"FISPlane", ^{
    __block FISPlane *plane;
    
    beforeEach(^{
        plane = [[FISPlane alloc] init];
    });
    
    it(@"is an FISPlane", ^{
        expect(plane).toNot.beNil();
        expect(plane).to.beInstanceOf([FISPlane class]);
    });
    
    it(@"is a subclass of FISVehicle", ^{
        expect([plane class]).to.beSubclassOf([FISVehicle class]);
    });
    
    it(@"has a weight of 255000", ^{
        expect(plane.weight).to.equal(255000.0f);
    });
    
    it(@"has a top speed of 614", ^{
        expect(plane.topSpeed).to.equal(614.0f);
    });
    
    it(@"has a current speed of 0",^{
        expect(plane.currentSpeed).to.equal(0.0f);
    });
    
    it(@"has a current direction of 0 (north)",^{
        expect(plane.currentDirection).to.equal(0.0f);
    });
    
    it(@"has an current altitude",^{
        expect(plane).to.respondTo(@selector(currentAltitude));
        expect(plane).to.respondTo(@selector(setCurrentAltitude:));
        expect(plane.currentAltitude).to.equal(0.0f);
    });
    
    it(@"has a top altitude",^{
        expect(plane).to.respondTo(@selector(topAltitude));
        expect(plane).to.respondTo(@selector(setTopAltitude:));
        expect(plane.topAltitude).to.equal(30000);
    });
    
    describe(@"increaseAltitude", ^{
        it(@"increases altitude to top altitude",^{
            [plane increaseAltitude];
            expect([plane currentAltitude]).to.equal(plane.topAltitude);
        });
    });
    
    describe(@"decreaseAltitude", ^{
        it(@"decreases altitude to 0",^{
            [plane decreaseAltitude];
            expect([plane currentAltitude]).to.equal(0.0f);
        });
    });
    
    
});

SpecEnd
