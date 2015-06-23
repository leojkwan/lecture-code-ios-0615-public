//
//  MyCopyableThing.h
//  ProtocolsAndDelegates
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCopyableThing : NSObject <NSCopying>

@property (nonatomic, strong) NSString *name;

@end
