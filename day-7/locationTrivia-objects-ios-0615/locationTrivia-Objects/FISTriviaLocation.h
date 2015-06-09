//
//  FISTriviaLocation.h
//  locationTrivia-Objects
//
//  Created by Timothy Clem on 6/9/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISTriviaLocation : NSObject

/*
 +triviaLocationWithName:latitude:longitude:
 */

@property (nonatomic, strong) NSString *name;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;

@property (nonatomic, readonly) BOOL isValid;
@property (nonatomic, strong, readonly) NSString *shortName;

/*
 We want a trivia object to have a "short name".
 Rules:
    If the full name is > 5 characters, truncate it at 5 and append "..."
    Otherwise, use the full name for the short name, unchanged.
*/

@end
