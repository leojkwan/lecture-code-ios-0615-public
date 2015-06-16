//
//  AppSetting.h
//  CustomTableViewCells
//
//  Created by Timothy Clem on 6/16/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppSetting : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *details;

@property (nonatomic, assign) BOOL isTogglable;
@property (nonatomic, assign, getter=isOn) BOOL on;
@property (nonatomic, assign) CGFloat value;

@end
