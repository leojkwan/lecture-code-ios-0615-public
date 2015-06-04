//
//  FISCaesarCipher.h
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCaesarCipher : NSObject

-(NSString *)encodeWithMessage:(NSString *)plaintext
                     andOffset:(NSInteger)offset;

-(NSString *)decodeWithMessage:(NSString *)plaintext
                     andOffset:(NSInteger)offset;

@end
