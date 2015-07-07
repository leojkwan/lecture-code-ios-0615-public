//
//  ViewController.m
//  arrayBlocks
//
//  Created by Zachary Drossman on 10/29/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSArray *array;
//    for(id obj in array) {
//        // do some stuff with obj.
//        NSLog(@"%@!", obj);
//    }

    NSArray *array = @[ @"a", @"b!", @"c!" ];
//    [self performBlock:^(id obj) {
//        NSLog(@"%@!", obj);
//    } forEachElementInArray:array];
//
//
//
//    // let's blockify this thing:
////    NSMutableArray *results = [[NSMutableArray alloc] init];
////    for(id obj in array) {
////        // do something to come up with a result
////        // add result to the results array
////    }
////
////    NSLog(@"%@", results);
//
//
//    // filter as a for loop
////    NSMutableArray *filteredResults = [[NSMutableArray alloc] init];
////    for(id obj in array) {
////        NSString *string = obj;
////        if([string hasSuffix:@"!"]) {
////            [filteredResults addObject:string];
////        }
////
////        // if some predicate is true for obj, add it to filteredResults
////        // otherwise, move along.
////    }
////    // return the filteredREsults
//
//
//
//
//    NSArray *excitedArray = [self mapBlock:^id(id obj) {
//        return [NSString stringWithFormat:@"%@!", obj];
//    } overArray:array];
//
//    NSLog(@"%@", excitedArray);



    NSLog(@"before the method call");
    NSArray *filteredResults = [self elementsOfArray:array passingTest:^BOOL(NSString *string) {
        NSLog(@"in the block! argument: %@", string);
        return [string hasSuffix:@"!"];
    }];
    NSLog(@"after the method call. return value: %@", filteredResults);
}

-(NSArray *)mapBlock:(id (^)(id obj))block overArray:(NSArray *)array
{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for(id obj in array) {
        // do something to come up with a result
        id result = block(obj);
        [results addObject:result];
    }

    return results;
}

-(void)performBlock:(void (^)(id obj))block forEachElementInArray:(NSArray *)array
{
    for(id obj in array) {
        block(obj);
    }
}

-(NSArray *)elementsOfArray:(NSArray *)array passingTest:(BOOL (^)(id obj))criterion
{
    NSMutableArray *winners = [[NSMutableArray alloc] init];
    for(id obj in array) {
        NSLog(@"in the method, before the block call. object: %@", obj);
        BOOL passes = criterion(obj);
        if(passes) {
            [winners addObject:obj];
        }
    }

    return winners;
}

@end
