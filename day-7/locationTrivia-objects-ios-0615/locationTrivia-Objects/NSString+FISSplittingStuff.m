//
//  NSString+FISSplittingStuff.m
//  locationTrivia-Objects
//
//  Created by Timothy Clem on 6/9/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "NSString+FISSplittingStuff.h"

@implementation NSString (FISSplittingStuff)

-(NSArray *)arrayOfCharacters
{
    NSMutableArray *letters = [[NSMutableArray alloc] init];

    for(NSUInteger i = 0; i < self.length; i++) {
        NSString *ithCharacter = [self substringWithRange:NSMakeRange(i, 1)];
        [letters addObject:ithCharacter];
    }
    
    return letters;
}

@end
