//
//  FISViewController.m
//  pickinFruit
//
//  Created by Joe Burgess on 7/3/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@property (strong, nonatomic) NSArray *fruitsArray;
@property (strong, nonatomic) IBOutlet UIPickerView *fruitPicker;
@property (strong, nonatomic) IBOutlet UIButton *spinButton;

@end

@implementation FISViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    self.fruitsArray = @[@"Apple",
                         @"Orange",
                         @"Banana",
                         @"Pear",
                         @"Grape",
                         @"Kiwi",
                         @"Mango",
                         @"Blueberry",
                         @"Raspberry"];

//    id<UIPickerViewDelegate>

    self.fruitPicker.delegate = self;
    self.fruitPicker.dataSource = self;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.fruitsArray.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.fruitsArray[row];
}

-(void)spinThePicker
{
    for(NSUInteger component = 0; component < 3; component++) {
        NSUInteger randomRow = (NSUInteger)arc4random_uniform((uint32_t)self.fruitsArray.count);

        [self.fruitPicker selectRow:randomRow inComponent:component animated:YES];
    }

    [self checkForWin];
}

-(IBAction)spin:(id)sender
{
    [self spinThePicker];
}

-(void)checkForWin
{
    // if all three components have the same selected row --> WINNER
    NSUInteger firstSelectedRow = [self.fruitPicker selectedRowInComponent:0];
    NSUInteger secondSelectedRow = [self.fruitPicker selectedRowInComponent:1];
    NSUInteger thirdSelectedRow = [self.fruitPicker selectedRowInComponent:2];


    NSString *alertMessage;
    if(firstSelectedRow == secondSelectedRow && secondSelectedRow == thirdSelectedRow) {
        // JACKPOT
        alertMessage = @"Jackpot!";
    }
    else {
        // Loser
        alertMessage = @"Gambling is totally ok. Keep doing it.";
    }

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:alertMessage
                                                   delegate:self  // This effectively does alert.delegate = self; for us
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Re-spin", nil];

    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1) {
        // Re-spin
        [self spinThePicker];
    }
}

@end
