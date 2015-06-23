//
//  FISViewController.m
//  gunnaRain
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import <Forecastr/Forecastr.h>

@interface FISViewController ()

@property (nonatomic, strong) Forecastr *forecastr;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.forecastr = [Forecastr sharedManager];
    self.forecastr.apiKey = @"24aa9123142357b970706acba456c80d";

    [self.forecastr getForecastForLatitude:40.8372204 longitude:-79.635973 time:nil exclusions:nil extend:nil success:^(id JSON) {
        NSDictionary *forecastData = JSON;
        NSDictionary *currentWeatherData = forecastData[@"currently"];

        [self updateUIForWeather:currentWeatherData];
    } failure:^(NSError *error, id response) {
        NSLog(@"Error! %@", error);
    }];
}

-(void)updateUIForWeather:(NSDictionary *)currentWeather
{
    NSNumber *precipProbabilityNumber = currentWeather[@"precipProbability"];
    CGFloat precipProbability = precipProbabilityNumber.floatValue;

    NSLog(@"Chance of precip: %.2f", precipProbability);

    if(precipProbability == 1) {
        // Change label to "YEP"
        self.weatherStatus.text = @"Yep";
    }
    else {
        // label to "NOPE"
        self.weatherStatus.text = @"Nope";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
