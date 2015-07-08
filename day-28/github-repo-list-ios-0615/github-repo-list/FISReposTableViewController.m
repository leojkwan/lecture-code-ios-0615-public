//
//  FISReposTableViewController.m
//  
//
//  Created by Joe Burgess on 5/5/14.
//
//

#import "FISReposTableViewController.h"
#import "FISReposDataStore.h"
#import "FISGithubRepository.h"

@interface FISReposTableViewController ()

@property (nonatomic, strong) NSArray *repositories;

@end

@implementation FISReposTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.accessibilityIdentifier = @"Repo Table View";
    self.tableView.accessibilityLabel = @"Repo Table View";

//    NSLog(@"before the api client call in the VC");
//    FISGithubAPIClient *apiClient = [[FISGithubAPIClient alloc] init];
//    [apiClient getRepositoriesWithCompletion:^(NSArray *repositories) {
//        NSLog(@"wooo! in the VC's completion block!");
//    }];
//    NSLog(@"after the api client call in the VC");

    [[FISReposDataStore sharedDataStore] fetchRepositoriesWithCompletion:^(BOOL success) {
        FISReposDataStore *dataStore = [FISReposDataStore sharedDataStore];
        NSLog(@"Done! in the VC! There are %lu repos in the data store", dataStore.repositories.count);

        self.repositories = dataStore.repositories;

        //        [self.tableView reloadData];

//        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];

//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.repositories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    FISGithubRepository *repo = self.repositories[indexPath.row];
    cell.textLabel.text = repo.fullName;
    
    return cell;
}

@end
