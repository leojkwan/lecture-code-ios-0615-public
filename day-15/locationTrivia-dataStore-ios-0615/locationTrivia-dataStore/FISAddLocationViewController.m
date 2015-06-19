//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Timothy Clem on 6/19/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataManager.h"

@interface FISAddLocationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *latitudeField;

@property (weak, nonatomic) IBOutlet UITextField *longitudeField;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancelButtonTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)inputIsValid
{
    BOOL hasName = self.nameField.text.length > 0;
    BOOL hasLat = self.latitudeField.text.length > 0;
    BOOL hasLng = self.longitudeField.text.length > 0;

    return hasName && hasLat && hasLng;
}

-(IBAction)saveButtonTapped:(id)sender
{
    if(![self inputIsValid]) {
        // Alert the user

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Invalid Input" message:@"All fields are required." preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];

        [self presentViewController:alert animated:YES completion:nil];

//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"All fields are required" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];

        return;
    }

    // NSString -> <intermediate integer type> -> NSNumber  :(
    NSNumber *latitudeNumber = @(self.latitudeField.text.integerValue);
    NSNumber *longitudeNumber= @(self.longitudeField.text.integerValue);

    FISLocation *newLocation = [[FISLocation alloc] initWithName:self.nameField.text latitude:latitudeNumber longitude:longitudeNumber];

    FISLocationsDataManager *dataManager = [FISLocationsDataManager sharedLocationsDataManager];

    [dataManager.locations addObject:newLocation];

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
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
