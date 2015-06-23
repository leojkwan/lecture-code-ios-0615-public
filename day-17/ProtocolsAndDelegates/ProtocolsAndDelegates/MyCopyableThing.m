//
//  MyCopyableThing.m
//  ProtocolsAndDelegates
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "MyCopyableThing.h"

@implementation MyCopyableThing

-(id)copyWithZone:(NSZone *)zone
{
    MyCopyableThing *theCopy = [[MyCopyableThing alloc] init];
    theCopy.name = self.name;
    return theCopy;
}

@end
