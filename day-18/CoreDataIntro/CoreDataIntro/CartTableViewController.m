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


@interface CartTableViewController ()

@property (nonatomic, strong) DataManager *dataManager;

@end


@implementation CartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataManager = [DataManager sharedManager];

//    NSFetchRequest *merchFetch = [[NSFetchRequest alloc] initWithEntityName:@"Merchandise"];
//    self.dataManager.shoppingCart = [self.dataManager.managedObjectContext executeFetchRequest:merchFetch error:nil];



//    Merchandise *newMerch = [NSEntityDescription insertNewObjectForEntityForName:@"Merchandise"
//                                                          inManagedObjectContext:self.dataManager.managedObjectContext];
//    newMerch.name = @"Shiba Inu";
//    newMerch.priceInCents = 9999;
//
//
//    Tag *puppyTag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.dataManager.managedObjectContext];
//    puppyTag.name = @"puppy";


//    [newMerch addTagsObject:puppyTag];
//    [puppyTag addMerchandiseObject:newMerch];
//    [newMerch removeTagsObject:puppyTag];

//    NSLog(@"Tags:");
//    for(Tag *tag in newMerch.tags) {
//        NSLog(@"%@", tag.name);
//    }
//
//    NSLog(@"Merch for tag:");
//    for(Merchandise *merch in puppyTag.merchandise) {
//        NSLog(@"%@", merch.name);
//    }
//
//    [self.dataManager saveContext];


    NSFetchRequest *allTagsRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tag"];
    NSArray *allTags = [self.dataManager.managedObjectContext executeFetchRequest:allTagsRequest error:nil];

    for(Tag *tag in allTags) {
        NSLog(@"Tag: %@", tag.name);
        for(Merchandise *merch in tag.merchandise) {
            NSLog(@"\t%@", merch.name);
        }
    }



//    self.dataManager.shoppingCart = [@[ newMerch ] mutableCopy];
}

-(Tag *)tagWithName:(NSString *)name
{
    // make a fetch request for a tag with the given name
    // returned something? return that.
    // nope? make a new one.

    NSFetchRequest *tagRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tag"];

    tagRequest.predicate = [NSPredicate predicateWithFormat:@"name == %@", name];
    NSArray *tags = [self.dataManager.managedObjectContext executeFetchRequest:tagRequest error:nil];

    if(tags.count > 0) {
        return tags.firstObject;
    }

    Tag *tag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.dataManager.managedObjectContext];
    tag.name = name;

    return tag;
}

//-(NSArray *)dummyInventory
//{
//    Merchandise *m1 = [[Merchandise alloc] init];
//    m1.name = @"Beard Oil";
//    m1.priceInCents = 652;
//
//    Merchandise *m2 = [[Merchandise alloc] init];
//    m2.name = @"Shiba Inu";
//    m2.priceInCents = 7000;
//
//    Merchandise *m3 = [[Merchandise alloc] init];
//    m3.name = @"Pizza Sauce";
//    m3.priceInCents = 399;
//
//    return @[ m1, m2, m3 ];
//}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataManager.shoppingCart.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellReuseID" forIndexPath:indexPath];

    Merchandise *item = self.dataManager.shoppingCart[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.formattedPrice;

    return cell;
}

@end
