//
//  CartTableTableViewController.m
//  CoreDataIntro
//
//  Created by Timothy Clem on 6/24/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "CartTableViewController.h"
#import "DataManager.h"
#import "Merchandise.h"
#import "Merchandise+Methods.h"
#import "Tag.h"


@interface CartTableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) DataManager *dataManager;

@property (nonatomic, strong) NSFetchedResultsController *resultsController;

@end


@implementation CartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataManager = [DataManager sharedManager];

    NSFetchRequest *merchFetch = [[NSFetchRequest alloc] initWithEntityName:@"Merchandise"];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    merchFetch.sortDescriptors = @[ sortDescriptor ];

    self.resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:merchFetch
                                                                 managedObjectContext:self.dataManager.managedObjectContext
                                                                   sectionNameKeyPath:nil
                                                                            cacheName:nil];

    self.resultsController.delegate = self;

    [self.resultsController performFetch:nil];
}

-(IBAction)addButtonTapped:(id)sender
{
    Merchandise *newMerch = [NSEntityDescription insertNewObjectForEntityForName:@"Merchandise"
                                                          inManagedObjectContext:self.dataManager.managedObjectContext];

    newMerch.name = [[NSDate alloc] init].description;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.resultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    if ([[self.resultsController sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.resultsController sections] objectAtIndex:section];
        return [sectionInfo numberOfObjects];
    }

    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellReuseID" forIndexPath:indexPath];

    Merchandise *item = [self.resultsController objectAtIndexPath:indexPath];

    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.formattedPrice;
    return cell;
}

#pragma mark - NSFetchedResultsControllerDelegate methods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {

    UITableView *tableView = self.tableView;

    switch(type) {

        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;

        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;

//        case NSFetchedResultsChangeUpdate: {
//            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//            if (cell != nil) {
//                [self configureCell:cell withObject:anObject];
//            }}
//            break;

        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id )sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type {

    switch(type) {

        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;

        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;

        default:
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.shoppingCart.count;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView
//        cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellReuseID" forIndexPath:indexPath];
//
//    Merchandise *item = self.shoppingCart[indexPath.row];
//    cell.textLabel.text = item.name;
//    cell.detailTextLabel.text = item.formattedPrice;
//
//    return cell;
//}

@end
