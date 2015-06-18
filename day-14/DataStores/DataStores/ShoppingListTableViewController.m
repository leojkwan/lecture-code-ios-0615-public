//
//  ShoppingListTableViewController.m
//  playingWithTableViews
//
//  Created by Joe Burgess on 2/13/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "ShoppingListTableViewController.h"
#import "DataManager.h"

@interface ShoppingListTableViewController ()

//@property (nonatomic, strong) NSMutableArray *shoppingList;
@property (nonatomic, strong) DataManager *dataManager;

@end

@implementation ShoppingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataManager = [DataManager sharedDataManager];

    for(NSUInteger i = 0; i < 1; i++) {
        [self.dataManager.shoppingList addObject:@"🍅"];
        [self.dataManager.shoppingList addObject:@"🍍"];
        [self.dataManager.shoppingList addObject:@"🐶"];
    }

//    [[NSUserDefaults standardUserDefaults] setObject:@"HEllooo" forKey:@"test"];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"test"]);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.

    return [self.dataManager.shoppingList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];

    cell.textLabel.text = self.dataManager.shoppingList[indexPath.row];
    
    return cell;
}

@end
