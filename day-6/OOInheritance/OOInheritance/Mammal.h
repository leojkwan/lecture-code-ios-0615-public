//
//  Mammal.h
//  OOInheritance
//
//  Created by Timothy Clem on 6/8/15.
//  Copyright (c) 2015 flatiron. All rights reserved.
//

#import "Animal.h"

@interface Mammal : Animal

@property (nonatomic, strong) NSString *hairColor;
@property (nonatomic, assign) BOOL doesLayEggs;

@end
