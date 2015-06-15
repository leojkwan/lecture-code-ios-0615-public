//
//  Word.h
//  IntroToTableviews
//
//  Created by Timothy Clem on 6/15/15.
//  Copyright (c) 2015 Misterfifths Heavy Industries. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Definition : NSObject

+(instancetype)definitionWithWord:(NSString *)word meaning:(NSString *)meaning;

@property (nonatomic, strong) NSString *word;
@property (nonatomic, strong) NSString *definition;

@end
