//
//  ViewController.m
//  PlayingWithBlocks
//
//  Created by Timothy Clem on 7/7/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import "NSString+ExtraMethods.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *strings = @[ @"hi", @"hello", @"abc", @"do" ];
    NSIndexSet *indexes = [strings indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        NSString *string = obj;
        return string.length == 2;
    }];
    NSLog(@"%@", indexes);


//    NSArray *winners = [@"bees knees" collectCharactersUsingBlock:^(NSArray *characters, NSUInteger idx, NSMutableArray *winners) {
//        // Job of this block is to check if the character at idx is a winner, and if so, add it to winners.
//        if(idx == 0) {
//            return;
//        }
//
//        NSString *currentCharacter = characters[idx];
//        NSString *previousCharacter = characters[idx - 1];
//        if([currentCharacter isEqualToString:previousCharacter]) {
//            [winners addObject:currentCharacter];
//        }
//    }];

    BOOL (^doubledCharacterCriterion)(NSArray *characters, NSUInteger idx) = ^BOOL(NSArray *characters, NSUInteger idx) {
        if(idx == 0) {
            return NO;
        }

        NSString *currentCharacter = characters[idx];
        NSString *previousCharacter = characters[idx - 1];
        return [currentCharacter isEqualToString:previousCharacter];
    };

    NSArray *winners = [@"bees knees" charactersPassingTest:doubledCharacterCriterion];


//    NSArray *winners = [@"bees knees" charactersPassingTest:^BOOL(NSArray *characters, NSUInteger idx) {
//        // Job of this block is to return if the character at idx is a winner
//        if(idx == 0) {
//            return NO;
//        }
//
//        NSString *currentCharacter = characters[idx];
//        NSString *previousCharacter = characters[idx - 1];
//        return [currentCharacter isEqualToString:previousCharacter];
//    }];


    NSLog(@"%@", winners);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
