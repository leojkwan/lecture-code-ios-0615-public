//
//  FISTimerOperation.m
//  filtered-images
//
//  Created by James Campagno on 7/17/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISTimerOperation.h"

@implementation FISTimerOperation

-(void)main
{
    for(NSUInteger i = 0; i < 1000000; i++) {
        NSLog(@"%lu", i);
        [NSThread sleepForTimeInterval:1];
        
        if(self.cancelled) {
            break;
        }
    }
}

@end
