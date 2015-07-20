//
//  FISImageProcessingOperation.h
//  filtered-images
//
//  Created by James Campagno on 7/17/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+Filters.h"

@interface FISImageProcessingOperation : NSOperation

@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, assign) UIImageFilterType filterType;

@property (nonatomic, strong) UIImage *filteredImage;

@property (nonatomic, copy) void (^filterCompletionBlock)(UIImage *filteredImage);

@end
