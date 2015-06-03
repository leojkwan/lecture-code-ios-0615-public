//
//  MyApp.m
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "MyApp.h"


@interface MyApp()

@end


@implementation MyApp

-(void)execute
{
    // Begin writing your code here. This method will kick off automatically.

    NSString *string = @"hello world";
    [string uppercaseString];


//    [self login];
    [self beInterviewed];
}

-(void)login
{
    NSLog(@"What is your name?");
    self.currentUser = [self requestKeyboardInput];

    NSLog(@"Hello, %@", self.currentUser);
}

-(void)beInterviewed
{
    NSArray *questions = @[ @"Where are you from?",
                            @"What high school did you go to?",
                            @"What is your favorite flavor of ice cream?" ];

    NSMutableArray *answers = [[NSMutableArray alloc] init];

    for (NSString *question in questions) {
        NSLog(@"%@", question);

        NSString *answer = [self requestKeyboardInput];
        [answers addObject:answer];
//        NSLog(@"%@ said '%@'", self.currentUser, answer);
    }

//    NSLog(@"%@", answers);

    for(NSUInteger i = 0; i < answers.count; i++) {
        NSString *answer = answers[i];
        NSString *question = questions[i];

        NSLog(@"%@\n%@", question, answer);
    }


//    NSLog(@"Where are you from?");
//    NSString *hometown = [self requestKeyboardInput];
//
//    NSLog(@"%@ is from %@", self.currentUser, hometown);
//
//
//    NSLog(@"What high school did you go to?");
//    NSString *highSchool = [self requestKeyboardInput];
//
//    NSLog(@"%@ went to %@ for high school", self.currentUser, highSchool);
}


// This method will read a line of text from the console and return it as an NSString instance.
// You shouldn't have any need to modify (or really understand) this method.
-(NSString *)requestKeyboardInput
{
    char stringBuffer[4096] = { 0 };  // Technically there should be some safety on this to avoid a crash if you write too much.
    scanf("%[^\n]%*c", stringBuffer);
    return [NSString stringWithUTF8String:stringBuffer];
}

@end
