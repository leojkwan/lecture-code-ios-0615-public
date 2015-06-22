//
//  ViewController.m
//  FISTweeter
//
//  Created by Timothy Clem on 6/22/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import <STTwitter/STTwitter.h>

@interface ViewController ()

@property (nonatomic, strong) STTwitterAPI *twitterClient;
@property (nonatomic, strong) NSArray *statuses;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.twitterClient = [STTwitterAPI twitterAPIWithOAuthConsumerKey:@"fWQqXBkjLTRI4lMvkbFZ5p9HP" consumerSecret:@"o8MtIm9P1Km1dkDI9dNghWBAVThkJ0DerqtCJ6qxCnRDBRryG9"];

//    self.twitterClient = [STTwitterAPI twitterAPIOSWithFirstAccount];

    NSLog(@"before api call");

    [self.twitterClient getSearchTweetsWithQuery:@"@flatironschool" successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
        NSLog(@"Got Statuses");
        self.statuses = statuses;
        [self.tableView reloadData];
    } errorBlock:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    NSLog(@"after api call");

//    [self.refreshControl beginRefreshing];
//    [self refreshTriggered:self.refreshControl];
}

-(IBAction)refreshTriggered:(id)sender
{
    // do whatever we want
    // when that's done, call endRefreshing

    [self.twitterClient getSearchTweetsWithQuery:@"@flatironschool" successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
        NSLog(@"Got Statuses");
        self.statuses = statuses;
        [self.tableView reloadData];

        [self.refreshControl endRefreshing];
    } errorBlock:^(NSError *error) {
        NSLog(@"Error: %@", error);
        // show alert, probably?

        [self.refreshControl endRefreshing];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];

    NSDictionary *tweet = self.statuses[indexPath.row];

    cell.textLabel.text = tweet[@"text"];

    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
