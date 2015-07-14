//
//  FISReposViewController.m
//  github-repo-search
//
//  Created by Timothy Clem on 7/13/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISReposViewController.h"
#import "FISReposDataStore.h"
#import "FISGithubAPIClient.h"

@interface FISReposViewController ()

@property (nonatomic, strong) FISReposDataStore *dataStore;

@end


@implementation FISReposViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    self.dataStore = [FISReposDataStore sharedDataStore];

    [FISGithubAPIClient getStarStatusForRepositoryNamed:@"SnapKit/Masonry" completion:^(BOOL isStarred) {
        NSLog(@"in the completion block");
    }];

//    [self.dataStore getRepositoriesWithCompletion:^(BOOL success) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//    }];
//
//    [self.dataStore searchForRepositoriesWithQuery:@"dominoes" completion:^(BOOL success) {
//        NSLog(@"in the completion block");
//
//        [self.tableView reloadData];
//    }];
}

-(void)updateReposForSearchQuery:(NSString *)query
{
    [self.dataStore searchForRepositoriesWithQuery:query completion:^(BOOL success) {
        NSLog(@"in the completion block");
        [self.tableView reloadData];
    }];
}

-(IBAction)searchButtonTapped:(id)sender
{
    // present alert controller with text field
    // use the entered text to search github
    // update the tableview with the new results

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Search" message:@"Enter your query below." preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *searchAction = [UIAlertAction actionWithTitle:@"Search" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // Pull out the text and search with it.

        UITextField *textField = alert.textFields[0];
        NSLog(@"%@", textField.text);

        [self updateReposForSearchQuery:textField.text];
    }];

    [alert addAction:searchAction];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.backgroundColor = [UIColor greenColor];
        textField.placeholder = @"query";
    }];

    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark UITableViewDataSource & Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataStore.repositories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RepoCell" forIndexPath:indexPath];

    FISGithubRepository *repo = self.dataStore.repositories[indexPath.row];

    cell.textLabel.text = repo.fullName;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
