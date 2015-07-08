//
//  FoursquareAPIClient.h
//  PlayingWithNSURLSession
//
//  Created by Timothy Clem on 7/8/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoursquareAPIClient : NSObject

-(void)getNamesOfVenuesNearZipCode:(NSString *)zipCode
                 completionHandler:(void (^)(NSArray *venueNames, NSError *error))completionBlock;

@end
