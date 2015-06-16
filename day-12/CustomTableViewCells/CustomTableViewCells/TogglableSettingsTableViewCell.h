//
//  TogglableSettingsTableViewCell.h
//  CustomTableViewCells
//
//  Created by Timothy Clem on 6/16/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TogglableSettingsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@property (weak, nonatomic) IBOutlet UISwitch *onOffSwitch;


@end
