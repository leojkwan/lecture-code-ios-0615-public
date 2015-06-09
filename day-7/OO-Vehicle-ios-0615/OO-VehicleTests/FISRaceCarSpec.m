//
//  FISRaceCarSpec.m
//  OO-Vehicle
//
//  Created by Chris Gonzales on 5/7/14.
//  Copyright 2014 FIS. All rights reserved.
//

#import "Specta.h"
#import "FISRaceCar.h"
#define EXP_SHORTHAND
#import "Expecta.h"

SpecBegin(FISRaceCar)

describe(@"FISRaceCar", ^{
    __block FISRaceCar *raceCar = [[FISRaceCar alloc] init];
    
    beforeEach(^{
        
    });
    
    it(@"is an FISRaceCar", ^{
        expect(raceCar).toNot.beNil();
        expect(raceCar).to.beInstanceOf([FISRaceCar class]);
    });
    
    it(@"is a subclass of FISVehicle", ^{
        expect([raceCar class]).to.beSubclassOf([FISVehicle class]);
    });
    
    it(@"has a weight of 1270",^{
        expect(raceCar.weight).to.equal(1270.0f);
    });
    
    it(@"has a top speed of 615",^{
        expect(raceCar.topSpeed).to.equal(615.0f);
    });
    
    it(@"has sponsors",^{
        expect(raceCar.sponsors).to.equal(@[@"KFC", @"Taco Bell", @"Pizza Hut"]);
    });
    
});

SpecEnd
