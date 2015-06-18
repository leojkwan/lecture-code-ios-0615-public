//
//  FISPrimesTableViewController.m
//  PrimeTime
//
//  Created by Tom OMalley on 6/18/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISPrimesTableViewController.h"

@interface FISPrimesTableViewController ()
@property (strong, nonatomic) NSMutableArray *primes;
@end

@implementation FISPrimesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.primes = [self primeNumber:2001];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2001;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"primeCell" forIndexPath:indexPath];

    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.primes[indexPath.row]];
    
    return cell;
}


#pragma mark - Helpers

-(NSMutableArray *) primeNumber: (NSInteger) nthPrime
{
    
    NSMutableArray *primes = [[NSMutableArray alloc] init];
    [primes addObject:@2];
    
    for (NSInteger i = 3; primes.count < nthPrime; i++)
    {
        if ([self isPrime:i]) {
            [primes addObject: @(i)];
        }
    }
    
    return primes;
}

-(BOOL) isPrime: (NSInteger) numberInQuestion
{
    for (NSInteger i = 2; i < numberInQuestion; i++) {
        if (numberInQuestion % i == 0) {
            return NO;
        }
    }
    return YES;
}



@end
