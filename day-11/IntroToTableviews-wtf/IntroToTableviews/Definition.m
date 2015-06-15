//
//  Word.m
//  IntroToTableviews
//
//  Created by Timothy Clem on 6/15/15.
//  Copyright (c) 2015 Misterfifths Heavy Industries. All rights reserved.
//

#import "Definition.h"

@implementation Definition

+(instancetype)definitionWithWord:(NSString *)word meaning:(NSString *)meaning
{
    Definition *instance = [[Definition alloc] init];
    instance.word = word;
    instance.definition = meaning;
    return instance;
}

@end
