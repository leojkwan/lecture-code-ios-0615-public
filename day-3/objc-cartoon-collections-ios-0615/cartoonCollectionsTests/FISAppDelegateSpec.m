//
//  FISAppDelegateSpec.m
//  cartoonCollections
//
//  Created by Chris Gonzales on 9/29/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#import "FISAppDelegate.h"
#define EXP_SHORTHAND
#import "Expecta/Expecta.h"

SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{

    describe(@"Cartoon Collections Methods", ^{
        __block FISAppDelegate *appDelegate;
        
        beforeAll(^{
            appDelegate = [UIApplication sharedApplication].delegate;
        });
        
        describe(@"rollCallDwarves:", ^{
            __block NSArray *dwarvesToBeRollCalled;
            
            beforeAll(^{
                dwarvesToBeRollCalled = @[@"Doc",@"Dopey",@"Bashful"];
            });
            
            it(@"should take in an NSArray of dwarves and returns a roll call sheet with their number",^{
                expect([appDelegate rollCallDwarves:dwarvesToBeRollCalled]).to.equal(@"1. Doc | 2. Dopey | 3. Bashful");
            });
        
            it(@"should return an NSString",^{
                expect([appDelegate rollCallDwarves:dwarvesToBeRollCalled]).to.beKindOf([NSString class]);
            });
        });
        
        describe(@"summonCaptainPlanet:", ^{
            __block NSArray *callsToBeGivenWithHeart;
            
            beforeAll(^{
                callsToBeGivenWithHeart = @[@"earth",@"wind"];
            });
            
            it(@"should take an NSArray of forces and return another NSArray with a capitalized and exclamation point after",^{
                expect([appDelegate summonCaptainPlanet:callsToBeGivenWithHeart]).to.equal(@[@"EARTH!", @"WIND!"]);
            });
        
            it(@"should return an NSArray",^{
                expect([appDelegate summonCaptainPlanet:callsToBeGivenWithHeart]).to.beKindOf([NSArray class]);
            });
        });
        
        describe(@"longPlaneteerCalls:", ^{
            __block NSArray *callsToBeGivenWithHeart;
            
            beforeAll(^{
                callsToBeGivenWithHeart = @[@"earth",@"wind"];
            });
            
            it(@"should take in a list of planeteerCalls and returns the list of planeteerCalls that have more then 4 characters",^{
                expect([appDelegate longPlaneteerCalls:callsToBeGivenWithHeart]).to.equal(@[@"earth"]);
            });
        
            it(@"should return an NSArray",^{
                expect([appDelegate longPlaneteerCalls:callsToBeGivenWithHeart]).to.beKindOf([NSArray class]);
            });
        });
        
        describe(@"findTheCheese:", ^{
            __block NSArray *possibleCheeses;
            
            beforeAll(^{
                possibleCheeses = @[@"prosciutto", @"camembert", @"baguette"];
            });
            
            it(@"should look through the NSArray of NSStrings and find the first string that matches one of the following cheese strings: 'cheddar', 'gouda', or 'camembert'. It should then return the NSString of the resulting search. If it doesn't find anything, return nil",^{
                expect([appDelegate findTheCheese:possibleCheeses]).to.equal(@"camembert");
                expect([appDelegate findTheCheese:@[@"prosciutto", @"baguette"]]).to.beNil();
            });
        
            it(@"should return an NSString",^{
                expect([appDelegate findTheCheese:possibleCheeses]).to.beKindOf([NSString class]);
            });
        });
        
        describe(@"calculateDollarAmountsWithReceipt:", ^{
            __block NSArray *scroogesMoney;
            
            beforeAll(^{
                scroogesMoney = @[@"$$",@"$",@"$$$"];
            });
            
            it(@"should take an array like that in, and should return another array converted to monetary values",^{
                expect([appDelegate calculateDollarAmountsWithReceipt:scroogesMoney
                        ]).to.equal(@[@"$2",@"$1",@"$3"]);
            });
        
            it(@"should return an NSArray",^{
                expect([appDelegate calculateDollarAmountsWithReceipt:scroogesMoney
                        ]).to.beKindOf([NSArray class]);
            });
        });
    });
});

SpecEnd
