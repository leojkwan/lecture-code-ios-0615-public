//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by James Campagno on 6/17/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self generateTestData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.locations count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    FISLocation *location = self.locations[section];
    return [location.trivia count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    FISLocation *location = self.locations[section];
    return location.name;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailTextLabel" forIndexPath:indexPath];
    
    FISLocation *location = self.locations[indexPath.section];
    
    FISTrivia *triviaItemAtThatRow = location.trivia[indexPath.row];
    
    cell.textLabel.text = triviaItemAtThatRow.content;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    FISLocation *locationAtIndexPath = self.locations[indexPath.row];
    
    FISTriviaTableViewController *destVC = segue.destinationViewController;
    
    destVC.trivia = locationAtIndexPath.trivia;
    
}


- (void)generateTestData {
    
    FISLocation *jimsHouse = [[FISLocation alloc] initWithName:@"JIM TOWN"
                                                      Latitude:@40.7127
                                                     Longitude:@74.0059];
    
    FISTrivia *jhTrivia1 = [[FISTrivia alloc] initWithContent:@"Won sexiest Mayor 5 straight years."
                                                        Likes:100];
    FISTrivia *jhTrivia2 = [[FISTrivia alloc] initWithContent:@"Most Italian restaurants in the world."
                                                        Likes:5];
    
    [jimsHouse.trivia addObjectsFromArray:@[jhTrivia1, jhTrivia2]];
    
    
    FISLocation *tomsHouse = [[FISLocation alloc] initWithName:@"Tom Town"
                                                      Latitude:@25.1971
                                                     Longitude:@55.2741];
    
    FISTrivia *thTrivia1 = [[FISTrivia alloc] initWithContent:@"In 2015, residents fled to Jim Town."
                                                        Likes:0];
    FISTrivia *thTrivia2 = [[FISTrivia alloc] initWithContent:@"Voted most corrupt town on Earth."
                                                        Likes:100];
    
    [tomsHouse.trivia addObjectsFromArray:@[thTrivia1, thTrivia2]];
    
    FISLocation *neilsHouse = [[FISLocation alloc] initWithName:@"Pluto"
                                                       Latitude:@99
                                                      Longitude:@100];
    
    FISTrivia *ndtTrivia1 = [[FISTrivia alloc] initWithContent:@"Light takes 6 hours to travel to Earth."
                                                         Likes:55];
    
    FISTrivia *ndtTrivia2 = [[FISTrivia alloc] initWithContent:@"Is smaller than Earth's Moon."
                                                         Likes:65];
    FISTrivia *ndtTrivia3 = [[FISTrivia alloc] initWithContent:@"Hates Neil deGrasse Tyson."
                                                         Likes:1];
    
    [neilsHouse.trivia addObjectsFromArray:@[ndtTrivia1, ndtTrivia2, ndtTrivia3]];
    
    
    self.locations = @[jimsHouse, tomsHouse, neilsHouse];
    
}


@end
