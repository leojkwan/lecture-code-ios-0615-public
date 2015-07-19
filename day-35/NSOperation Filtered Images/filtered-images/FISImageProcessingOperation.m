//
//  FISImageProcessingOperation.m
//  filtered-images
//
//  Created by James Campagno on 7/17/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISImageProcessingOperation.h"


@implementation FISImageProcessingOperation

-(void)main
{
    self.filteredImage = [self.originalImage imageWithFilter:self.filterType];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.filterCompletionBlock(self.filteredImage);
    }];
}

@end
