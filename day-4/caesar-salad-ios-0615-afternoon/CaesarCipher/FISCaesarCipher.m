//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher

-(NSString *)encodeWithMessage:(NSString *)plaintext
                     andOffset:(NSInteger)offset
{
    NSArray *charactersInPlaintext = [self arrayWithCharactersOfString:plaintext];

    NSMutableString *ciphertext = [[NSMutableString alloc] init];

    for (NSString *character in charactersInPlaintext) {
        NSString *shiftedCharacter = [self shiftCharacter:character byOffset:offset];

        [ciphertext appendString:shiftedCharacter];
    }

    return ciphertext;
}

-(NSString *)decodeWithMessage:(NSString *)plaintext
                     andOffset:(NSInteger)offset
{
    return @"";
}

-(NSString *)shiftCharacter:(NSString *)characterString
                   byOffset:(NSInteger)offset
{
    unichar firstCharacter = [characterString characterAtIndex:0];

    NSInteger reducedOffset = offset % 26;

    /*
        'a' -> 97
        'z' -> 122
        'A' -> 65
        'Z' -> 90
     */

    BOOL isLowerCase = firstCharacter >= 97 && firstCharacter <= 122;
    BOOL isUpperCase = firstCharacter >= 65 && firstCharacter <= 90;

    if(isLowerCase || isUpperCase) {
        unichar shiftedFirstCharacter = firstCharacter + reducedOffset;

        if(isLowerCase && shiftedFirstCharacter > 122) {
            shiftedFirstCharacter -= 26;
        }
        else if(isUpperCase && shiftedFirstCharacter > 90) {
            shiftedFirstCharacter -= 26;
        }

        return [NSString stringWithFormat:@"%C", shiftedFirstCharacter];
    }
    else {
        return characterString;
    }
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
