//
//  NSString+ExtraMethods.m
//  PlayingWithBlocks
//
//  Created by Timothy Clem on 7/7/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "NSString+ExtraMethods.h"

@implementation NSString (ExtraMethods)
//
//-(NSArray *)vowels
//{
//    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
//
//    NSMutableArray *winners = [[NSMutableArray alloc] init];
//    NSArray *characters = [self arrayWithCharactersOfString:self];
//
//    for(NSString *singleCharacterString in characters) {
//        if([vowelSet characterIsMember:[singleCharacterString characterAtIndex:0]]) {
//            [winners addObject:singleCharacterString];
//        }
//    }
//
//    return winners;
//}

//-(NSArray *)vowels
//{
//    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
//    return [self charactersInSet:vowelSet];
//}

-(NSArray *)capitalLetters
{
    NSCharacterSet *capitalSet = [NSCharacterSet capitalizedLetterCharacterSet];
    return [self charactersInSet:capitalSet];
}

-(NSArray *)charactersInSet:(NSCharacterSet *)characterSet
{
    NSMutableArray *winners = [[NSMutableArray alloc] init];
    NSArray *characters = [self arrayWithCharactersOfString:self];

    for(NSString *singleCharacterString in characters) {
        if([characterSet characterIsMember:[singleCharacterString characterAtIndex:0]]) {
            [winners addObject:singleCharacterString];
        }
    }

    return winners;
}

-(NSArray *)doubledCharacters
{
    NSMutableArray *winners = [[NSMutableArray alloc] init];
    NSArray *characters = [self arrayWithCharactersOfString:self];

    for(NSUInteger i = 0; i < characters.count; i++) {
        if(i == 0) {
            continue;
        }

        NSString *currentCharacter = characters[i];
        NSString *previousCharacter = characters[i - 1];
        if([currentCharacter isEqualToString:previousCharacter]) {
            [winners addObject:currentCharacter];
        }
    }

    return winners;
}

-(NSArray *)collectCharactersUsingBlock:(void (^)(NSArray *characters, NSUInteger idx, NSMutableArray *winners))collector
{
    NSMutableArray *winners = [[NSMutableArray alloc] init];
    NSArray *characters = [self arrayWithCharactersOfString:self];

    for(NSUInteger i = 0; i < characters.count; i++) {
        // So... now run the logic that got passed in.
        // That chunk of logic will need: the characters, the current index, and the winners array

        collector(characters, i, winners);
    }

    return winners;
}

-(NSArray *)charactersPassingTest:(BOOL (^)(NSArray *characters, NSUInteger idx))criterion
{
    NSMutableArray *winners = [[NSMutableArray alloc] init];
    NSArray *characters = [self arrayWithCharactersOfString:self];

    for(NSUInteger i = 0; i < characters.count; i++) {
        // So... now run the logic that got passed in.
        // That chunk of logic will need: the characters, the current index, and the winners array

        if(criterion(characters, i)) {
            [winners addObject:characters[i]];
        }
    }

    return winners;
}

-(NSArray *)vowels
{
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];

    return [self collectCharactersUsingBlock:^(NSArray *characters, NSUInteger idx, NSMutableArray *winners) {
        NSString *currentCharacter = characters[idx];
        unichar rawCharacter = [currentCharacter characterAtIndex:0];
        if([vowelSet characterIsMember:rawCharacter]) {
            [winners addObject:currentCharacter];
        }
    }];
}

-(NSArray *)arrayWithCharactersOfString:(NSString *)string
{
    NSMutableArray *letters = [[NSMutableArray alloc] init];

    for(NSUInteger i = 0; i < string.length; i++) {
        NSString *ithCharacter = [string substringWithRange:NSMakeRange(i, 1)];
        [letters addObject:ithCharacter];
    }

    return letters;
}

@end
