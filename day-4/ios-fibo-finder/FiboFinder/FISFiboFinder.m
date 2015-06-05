//
//  FiboFinder.m
//  FiboFinder
//
//  Created by Chris Gonzales on 6/2/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISFiboFinder.h"

@implementation FISFiboFinder

-(NSUInteger)fibonacciNumberAtIndex:(NSUInteger)index
{
    /*
     index          fibonacci number
     -----          ----------------
        0               0
        1               1
        2               1
        3               2
     ...
     */

    if(index == 0) {
        return 0;
    }
    else if(index == 1) {
        return 1;
    }

    NSMutableArray *fibonacciNumbers = [@[ @0, @1 ] mutableCopy];

    // index 2

    for(NSUInteger i = 0; i < index - 1; i++) {
        NSNumber *mostRecentFiboNumber = fibonacciNumbers[fibonacciNumbers.count - 1];

        NSNumber *secondMostRecentFiboNumber = fibonacciNumbers[fibonacciNumbers.count - 2];

        NSUInteger thisFiboNumber = mostRecentFiboNumber.unsignedIntegerValue + secondMostRecentFiboNumber.unsignedIntegerValue;

        NSNumber *numberizedFiboNumber = @(thisFiboNumber);
        [fibonacciNumbers addObject:numberizedFiboNumber];
    }

    NSNumber *theWinner = fibonacciNumbers.lastObject;
    return theWinner.unsignedIntegerValue;

    /*
     @[ @0, @1, @1, @2, @3, @5, ... ]
     */
}

@end
