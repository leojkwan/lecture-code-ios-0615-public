//
//  AppDelegate.m
//  thingsNSDictionaryCanDo
//
//  Created by Joe Burgess on 6/3/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    NSArray *instructorNames = @[@"Tim", @"Jim", @"Tom"];
    NSArray *instructorEmploymentHistory = @[@2, @1, @1.5];
    NSArray *instructorHairColor = @[@"Brown",@"Black",@"Black"];

    NSDictionary *jim = @{@"name": @"Jim Campagno",
                          @"employmentHistory": @1,
                          @"hairColor":@"Black",
                          @"friends":@[@"Joe"]};

    NSDictionary *tim = @{@"name": @"Tim Clem",
                          @"employmentHistory": @2,
                          @"hairColor":@"Brown"};
    NSDictionary *tom = @{@"name": @"Tom O'Malley",
                          @"employmentHistory": @1.5,
                          @"hairColor":@"Black"};


    NSDictionary *instructors = @{@"Jim": jim,
                                  @"Tim": tim,
                                  @"Tom": tom,
                                  @"Jim": tim};

    NSSortDescriptor *mySorter = [NSSortDescriptor sortDescriptorWithKey:@"employmentHistory" ascending:YES];


    NSMutableArray *allInstructors = [[instructors allValues] mutableCopy];
    [allInstructors sortUsingDescriptors:@[mySorter]];

    NSLog(@"%@",allInstructors);

    for (NSString *instructorName in instructors) {

       // NSLog(@"%@",instructors[instructorName]);

       NSLog(@"%@ has been at Flatiron for %@ months",instructors[instructorName][@"name"], instructors[instructorName][@"employmentHistory"]);

    }


       return YES;
}


@end
