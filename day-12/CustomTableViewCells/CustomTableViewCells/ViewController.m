//
//  ViewController.m
//  CustomTableViewCells
//
//  Created by Timothy Clem on 6/16/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import "TogglableSettingsTableViewCell.h"
#import "SliderSettingsTableViewCell.h"
#import "AppSetting.h"


@interface ViewController ()

@property (nonatomic, strong) NSArray *appSettings;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    AppSetting *s1 = [[AppSetting alloc] init];
    AppSetting *s2 = [[AppSetting alloc] init];
    AppSetting *s3 = [[AppSetting alloc] init];
    AppSetting *s4 = [[AppSetting alloc] init];

    s1.name = @"Notifications";
    s1.details = @"Give me push notifications";
    s1.on = YES;
    s1.isTogglable = YES;

    s2.name = @"Transparency";
    s2.details = @"So 1997";
    s2.value = 1.0;

    s3.name = @"Enable iCloud";
    s3.details = @"That sweet sweet cloud";
    s3.isTogglable = YES;

    s4.name = @"Volume";
    s4.details = @"Self-explanatory";
    s4.value = 0.25;

    self.appSettings = @[ s1, s2, s3, s4 ];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.appSettings.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger rowForCell = indexPath.row;
    AppSetting *appSetting = self.appSettings[rowForCell];

    if(appSetting.isTogglable) {
        TogglableSettingsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"OnOffSettingsCell" forIndexPath:indexPath];


        cell.onOffSwitch.on = appSetting.isOn;
        cell.nameLabel.text = appSetting.name;
        cell.detailsLabel.text = appSetting.details;

        return cell;
    }
    else {
        SliderSettingsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SliderCell" forIndexPath:indexPath];

        cell.nameLabel.text = appSetting.name;
        cell.slider.value = appSetting.value;

        return cell;
    }
}

@end
