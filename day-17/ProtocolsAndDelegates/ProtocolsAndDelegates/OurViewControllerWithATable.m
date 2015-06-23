//
//  OurViewControllerWithATable.m
//  ProtocolsAndDelegates
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "OurViewControllerWithATable.h"
#import "MyCopyableThing.h"

@interface OurViewControllerWithATable () 

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation OurViewControllerWithATable

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    // we might imagine that somewhere in UITableView...
    /*
    id<UITableViewDataSource> dataSource;
    for (NSUInteger section = 0; section < [dataSource numberOfSectionsInTableView:self]; section++) {
        for (NSUInteger row = 0; row < [dataSource tableView:self numberOfRowsInSection:section]; row++) {
            UITableViewCell *cell = [dataSource tableView:self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        }
    }
     */
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSLog(@"here!");
    return @"This Section Is The Best!";
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellReuseID"
                                                            forIndexPath:indexPath];

    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select %@", indexPath);
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
