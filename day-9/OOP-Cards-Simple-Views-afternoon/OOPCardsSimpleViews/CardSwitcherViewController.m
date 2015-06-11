//
//  FISCardSwitcherViewController.m
//  OOPCardsSimpleViews
//
//  Created by Chris Gonzales on 6/16/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "CardSwitcherViewController.h"
#import "PlayingCard.h"

@interface CardSwitcherViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@end

@implementation CardSwitcherViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)threeOfClubsButton:(id)sender
{
    UIButton *button = sender;
    self.topLabel.text = ((UIButton*)sender).titleLabel.text;
    NSLog(@"threeOfSpadesButtonTapped");

//    PlayingCard *threeOfClubs = [[PlayingCard alloc] initWithSuit:@"♠️" rank:@3];
//
//    [self updateUIWithCard: threeOfClubs];
}

- (IBAction)fourOfClubsButton:(id)sender {
    NSLog(@"fourOfClubsButtonTapped");
}

- (IBAction)tenOfHeartsButton:(id)sender {
    NSLog(@"tenOfHeartsButtonTapped");
}

- (IBAction)eightOfHeartsButton:(id)sender {
    NSLog(@"eightOfHeartsTapped");
}

-(void) updateUIWithCard: (PlayingCard *) card{
    NSString *cardString = [NSString stringWithFormat:@"%@ %@", card.rank, card.suit];

    self.topLabel.text = cardString;
    self.middleLabel.text = cardString;
    self.bottomLabel.text = cardString;
}
@end
