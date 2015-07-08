//
//  ViewController.m
//  PlayingWithNSURLSession
//
//  Created by Timothy Clem on 7/8/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import "FoursquareAPIClient.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    FoursquareAPIClient *client = [[FoursquareAPIClient alloc] init];
    [client getNamesOfVenuesNearZipCode:@"" completionHandler:^(NSArray *venueNames, NSError *error) {
        if(error) {
            NSLog(@"Error! %@", error);
            return;
        }

        NSLog(@"Names: %@", venueNames);
    }];
}

- (void)viewDidLoadButNotRightNow {
    [super viewDidLoad];

    NSURLSession *urlSession = [NSURLSession sharedSession];

    NSURL *url = [NSURL URLWithString:@"https://api.foursquare.com/v2/venues/search?near=11222&client_id=1032VNML03JTA1PTSEYS3L0N1TORNR5WZJSGYMQVHCJO4DPD&client_secret=Y42EPGJMEGAD5YI13OG3IPP24HY5KAHLGT3MVRYPDFBC2BGV&v=20150708"];

    NSURLSessionDataTask *task = [urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        if(error) {
            NSLog(@"Error! %@", error);
            return;
        }

        NSHTTPURLResponse *actualResponseInAUsefulFreakingType = (NSHTTPURLResponse *)response;
        if(actualResponseInAUsefulFreakingType.statusCode != 200) {
            NSLog(@"Something's amiss! %@", actualResponseInAUsefulFreakingType);
            return;
        }

        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *venues = dictionary[@"response"][@"venues"];

        for(NSDictionary *venue in venues) {
            NSString *venueID = venue[@"id"];

            // goal is to fetch /venues/:id for each venue in the search

            NSString *venueURLString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/%@?client_id=1032VNML03JTA1PTSEYS3L0N1TORNR5WZJSGYMQVHCJO4DPD&client_secret=Y42EPGJMEGAD5YI13OG3IPP24HY5KAHLGT3MVRYPDFBC2BGV&v=20150708", venueID];

            NSURL *venueURL = [NSURL URLWithString:venueURLString];

            NSURLSessionDataTask *venueTask = [urlSession dataTaskWithURL:venueURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSDictionary *venueDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

                NSLog(@"%@", venueDictionary[@"response"][@"venue"][@"contact"][@"phone"]);
            }];

            [venueTask resume];
        }
    }];

    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
