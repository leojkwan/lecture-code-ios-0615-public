//
//  FoursquareAPIClient.m
//  PlayingWithNSURLSession
//
//  Created by Timothy Clem on 7/8/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FoursquareAPIClient.h"

@implementation FoursquareAPIClient

-(NSURL *)urlForPath:(NSString *)path extraParams:(NSString *)params
{
    NSString *baseURL = @"https://api.foursquare.com/v2";
    NSString *defaultParams = @"client_id=1032VNML03JTA1PTSEYS3L0N1TORNR5WZJSGYMQVHCJO4DPD&client_secret=Y42EPGJMEGAD5YI13OG3IPP24HY5KAHLGT3MVRYPDFBC2BGV&v=20150708";

    NSString *urlString = [NSString stringWithFormat:@"%@%@?%@&%@", baseURL, path, params, defaultParams];
    return [NSURL URLWithString:urlString];
}

-(void)getNamesOfVenuesNearZipCode:(NSString *)zipCode
                 completionHandler:(void (^)(NSArray *, NSError *))completionBlock
{
    NSURLSession *urlSession = [NSURLSession sharedSession];


    NSString *nearParam = [@"near=" stringByAppendingString:zipCode];
    NSURL *url = [self urlForPath:@"/venues/search" extraParams:nearParam];

    NSURLSessionDataTask *task = [urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        // If an error happens, bail, but pass the error back to the block
        if(error) {
            NSLog(@"Error! %@", error);
            completionBlock(nil, error);
            return;
        }

        NSHTTPURLResponse *actualResponseInAUsefulFreakingType = (NSHTTPURLResponse *)response;
        if(actualResponseInAUsefulFreakingType.statusCode != 200) {
            NSLog(@"Something's amiss! %@", actualResponseInAUsefulFreakingType);

            // For some freaking stupid reason, NSURLSession doesn't convert non-200 responses into NSErrors... we could make our own... .... ugh.
            // this is gross. AFNetworking does this much better.
            NSError *wrappedError = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorUnknown userInfo:nil];
            completionBlock(nil, wrappedError);
            return;
        }

        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *venues = dictionary[@"response"][@"venues"];

        NSMutableArray *names = [[NSMutableArray alloc] init];
        for(NSDictionary *venue in venues) {
            NSString *name = venue[@"name"];
            [names addObject:name];
        }

        completionBlock(names, nil);
    }];
    
    [task resume];
}

@end
