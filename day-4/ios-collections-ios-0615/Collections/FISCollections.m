//
//  FISCollections.m
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCollections.h"

@implementation FISCollections

//define methods here
- (NSArray *)sortArrayAsc:(NSArray *)input
{
    NSSortDescriptor *ascendingSorter = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [input sortedArrayUsingDescriptors:@[ascendingSorter]];
}

- (NSArray *)sortArrayDesc:(NSArray *)array
{

    NSSortDescriptor *ascendingSorter = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    return [array sortedArrayUsingDescriptors:@[ascendingSorter]];
}

-(NSArray *)swapElements:(NSArray *)array
{
    NSString *thirdElement = array[2];
    NSString *secondElement = array[1];
    return @[array[0],thirdElement,secondElement];
}

- (NSArray *)reverseArray:(NSArray *)array
{
    return nil;
}

-  (NSArray *)keshaMaker:(NSArray *)array
{

    NSMutableArray *resultArray = [[NSMutableArray alloc] init];

    for (NSString *personName in array) {
        NSString *firstElement = personName;
        
        NSRange thirdCharacter = NSMakeRange(2, 1);
        NSString *keshaedString = [firstElement stringByReplacingCharactersInRange:thirdCharacter withString:@"$"];

        [resultArray addObject:keshaedString];
    }

    return resultArray;
}

- (NSDictionary *)greaterAndLessThan10:(NSArray *)array
{
    return nil;
}

- (NSArray *)findWinners:(NSDictionary *)peeps
{
    return nil;
}

- (NSArray *)findA:(NSArray *)array
{
    return nil;
}

- (NSInteger)sumArray:(NSArray *)array
{
    return 0;
}

- (NSArray *)addS:(NSArray *)array
{
    return nil;
}

- (NSDictionary *)countWordsInStory:(NSString *)story
{
    return nil;
}

- (NSDictionary *)organizeSongsByArtist:(NSArray *)jams
{
    return nil;
}


@end
