//
//  Merchandise.m
//  CoreDataIntro
//
//  Created by Timothy Clem on 6/24/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "Merchandise.h"

@implementation Merchandise

-(NSString *)formattedPrice
{
    return [NSString stringWithFormat:@"$%.2f", self.priceInCents / 100.0];
}

@end
