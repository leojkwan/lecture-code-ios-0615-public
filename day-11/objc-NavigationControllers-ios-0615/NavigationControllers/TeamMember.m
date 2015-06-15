//
//  TeamMember.m
//  NavigationControllers
//
//  Created by Timothy Clem on 6/15/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "TeamMember.h"

@implementation TeamMember

-(instancetype)initWithName:(NSString *)name image:(UIImage *)image
{
    self = [super init];
    if(self) {
        _name = name;
        _image = image;
    }

    return self;
}

@end
