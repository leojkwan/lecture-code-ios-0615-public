//
//  TeamMember.h
//  NavigationControllers
//
//  Created by Timothy Clem on 6/15/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamMember : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *image;

-(instancetype)initWithName:(NSString *)name image:(UIImage *)image;

@end
