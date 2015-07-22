//
//  FISDailyForecastView.m
//  pour-cast
//
//  Created by Timothy Clem on 7/22/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISDailyForecastView.h"

@interface FISDailyForecastView ()

@property (strong, nonatomic) IBOutlet UIView *rootView;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *highTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTemperatureLabel;

@end


@implementation FISDailyForecastView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self commonInit];
    }

    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self commonInit];
    }

    return self;
}

-(void)commonInit
{
    // load the nib. that will assign our outlets.

    [[NSBundle mainBundle] loadNibNamed:@"FISDailyForecastView"
                                  owner:self
                                options:nil];

    [self addSubview:self.rootView];

    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.rootView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[rootView]|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:@{ @"rootView": _rootView }];

    NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rootView]|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:@{ @"rootView": _rootView }];

    [self addConstraints:hConstraints];
    [self addConstraints:vConstraints];
}

-(void)setDailyForecast:(FISDailyForecast *)forecast
{
    _dailyForecast = forecast;

    [self updateUI];
}

-(void)updateUI
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MM/dd"];
    NSString *dateString = [format stringFromDate:self.dailyForecast.date];

    NSString *maxTemp = [NSString stringWithFormat:@"High: %.1fF", self.dailyForecast.temperatureMax];
    NSString *minTemp = [NSString stringWithFormat:@"Low: %.1fF", self.dailyForecast.temperatureMin];

    self.dateLabel.text = dateString;
    self.lowTemperatureLabel.text = minTemp;
    self.highTemperatureLabel.text = maxTemp;
}

@end
