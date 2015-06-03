//
//  FISAppDelegate.m
//  solving-trivia
//
//  Created by iOS Staff on 9/30/14
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import "FISAppDelegate.h"

@interface FISAppDelegate ()

@end


@implementation FISAppDelegate

-(NSString*) solveTrivia
{

    NSDictionary *statesAndTheirCapitals = @{
                                                                @"Alabama"  :@"Montgomery", @"Montana" :@"Helena",

                                                                @"Alaska" :@"Juneau", @"Nebraska" :@"Lincoln",

                                                                @"Arizona" :@"Phoenix", @"Nevada" :@"Carson City",

                                                                @"Arkansas" :@"Little Rock", @"New Hampshire" :@"Concord",

                                                                @"California":@"Sacramento", @"New Jersey":@"Trenton",

                                                                @"Colorado" :@"Denver", @"New Mexico" :@"Santa Fe",

                                                                @"Connecticut" :@"Hartford", @"New York" :@"Albany",

                                                                @"Delaware" :@"Dover", @"North Carolina" :@"Raleigh",

                                                                @"Florida" :@"Tallahassee", @"North Dakota" :@"Bismarck",

                                                                @"Georgia" :@"Atlanta", @"Ohio" :@"Columbus",

                                                                @"Hawaii" :@"Honolulu", @"Oklahoma" :@"Oklahoma City",

                                                                @"Idaho" :@"Boise", @"Oregon" :@"Salem",

                                                                @"Illinois" :@"Springfield", @"Pennsylvania" :@"Harrisburg",

                                                                @"Indiana" :@"Indianapolis", @"Rhode Island" :@"Providence",

                                                                @"Iowa" :@"Des Moines", @"South Carolina" :@"Columbia",
                                                                
                                                                @"Kansas" :@"Topeka", @"South Dakota " :@"Pierre ",
                                                                
                                                                @"Kentucky" :@"Frankfort", @"Tennessee" :@"Nashville",
                                                                
                                                                @"Louisiana" :@"Baton Rouge", @"Texas" :@"Austin",
                                                                
                                                                @"Maine" :@"Augusta", @"Utah" : @"Salt Lake City",
                                                                
                                                                @"Maryland" :@"Annapolis", @"Vermont" :@"Montpelier",
                                                                
                                                                @"Massachusetts" :@"Boston", @"Virginia" :@"Richmond",
                                                                
                                                                @"Michigan" :@"Lansing", @"Washington" :@"Olympia",
                                                                
                                                                @"Minnesota" :@"St. Paul", @"West Virginia" :@"Charleston",
                                                                
                                                                @"Mississippi" :@"Jackson", @"Wisconsin" :@"Madison",
                                                                
                                                                @"Missouri" :@"Jefferson City" , @"Wyoming" :@"Cheyenne"
                                                                
                                                                };

//    NSString *letter = @"a";
//    NSString *capital = @"Cheyenne";

//    NSLog(@"%d", [capital containsString:letter]);

//    NSString *state = @"Wyoming";

//    NSLog(@"%d", [self string:capital containsAnyLettersFromString:state]);

    for (NSString *state in statesAndTheirCapitals) {
        NSString *capital = statesAndTheirCapitals[state];

        if(![self string:capital containsAnyLettersFromString:state]) {
            NSLog(@"We have a winner: %@", state);
        }
    }



    return @"";
}

-(BOOL)string:(NSString *)firstString containsAnyLettersFromString:(NSString *)secondString
{
    

    NSArray *lettersInFirstString = [self arrayWithCharactersOfString:firstString];

    for (NSString *letter in lettersInFirstString) {
        if([secondString localizedCaseInsensitiveContainsString:letter]) {
            return YES;
        }
    }

    return NO;
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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self solveTrivia];


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
