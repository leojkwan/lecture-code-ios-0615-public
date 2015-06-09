//
//  FISTriviaLocation.m
//  locationTrivia-Objects
//
//  Created by Timothy Clem on 6/9/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISTriviaLocation.h"


@interface FISTriviaLocation ()

@property (nonatomic, strong) NSString *theAnswerThatShouldBeSecret;
@property (nonatomic, strong, readwrite) NSString *shortName;

@end


@implementation FISTriviaLocation


-(BOOL)isValid
{
    return self.name && self.latitude != 0 && self.longitude != 0;
}

-(void)setName:(NSString *)name
{
    _name = name;
    [self updateShortName];
}

-(void)updateShortName
{
    if(self.name.length > 5) {
        // truncate @ 5, add "..."
        self.shortName = [[self.name substringToIndex:5] stringByAppendingString:@"..."];
    }
    else {
        self.shortName = self.name;
    }
}

@end
