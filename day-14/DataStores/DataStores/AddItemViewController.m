//
//  AddItemViewController.m
//  DataStores
//
//  Created by Timothy Clem on 6/18/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "AddItemViewController.h"
#import "DataManager.h"

@interface AddItemViewController ()

@property (nonatomic, strong) DataManager *dataManagerBlahBlah;
@property (weak, nonatomic) IBOutlet UITextField *itemTextField;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataManagerBlahBlah = [DataManager sharedDataManager];
}

-(IBAction)doneButtonTapped:(id)sender
{
    // add the text in the text field to the shopping list

    [self.dataManagerBlahBlah.shoppingList addObject:self.itemTextField.text];

    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
