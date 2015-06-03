//
//  FISAppDelegateSpec.m
//  solving-trivia
//
//  Created by Tom OMalley on 5/11/15.
//  Copyright 2015 The Flatiron School. All rights reserved.
//

#import "Specta.h"
#import "FISAppDelegate.h"

SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{
    
    describe(@"solveTrivia method", ^{
        it(@"returns the only state who's capital contains none of the characters as the state name", ^{
            FISAppDelegate *delegate = ((FISAppDelegate*)[UIApplication sharedApplication].delegate);
            expect([delegate solveTrivia]).to.equal(@"South Dakota");
        });
    });
    
});

SpecEnd
