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

-(NSString *)shiftCharacter:(NSString *)characterString
                   byOffset:(NSInteger)offset
{
    unichar firstCharacter = [characterString characterAtIndex:0];
    unichar shiftedFirstCharacter = firstCharacter + offset;
    return [NSString stringWithFormat: @"%C", shiftedFirstCharacter];
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
