//
//  NSString+ExtraMethods.h
//  PlayingWithBlocks
//
//  Created by Timothy Clem on 7/7/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ExtraMethods)

-(NSArray *)vowels;
-(NSArray *)doubledCharacters;

-(NSArray *)collectCharactersUsingBlock:(void (^)(NSArray *characters, NSUInteger idx, NSMutableArray *winners))blockName;
-(NSArray *)charactersPassingTest:(BOOL (^)(NSArray *characters, NSUInteger idx))criterion;

@end
