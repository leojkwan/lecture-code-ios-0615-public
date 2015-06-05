//
//  Item.h
//  OOStuff
//
//  Created by Timothy Clem on 6/5/15.
//  Copyright (c) 2015 flatiron. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Item : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) CGFloat price;
@property (nonatomic) NSUInteger quantity;
@property (nonatomic, strong) NSMutableArray *colors;

-(instancetype)initWithName:(NSString *)name;

@end
