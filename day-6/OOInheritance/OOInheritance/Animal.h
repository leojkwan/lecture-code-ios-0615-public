//
//  Animal.h
//  OOInheritance
//
//  Created by Timothy Clem on 6/8/15.
//  Copyright (c) 2015 flatiron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic, strong) NSString *commonName;

-(void)sayHello;

@end
