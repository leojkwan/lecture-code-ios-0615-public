//
//  FISPrimeViewsSpec.m
//  PrimeTime
//
//  Created by Chris Gonzales on 5/15/14.
//  Copyright 2014 FIS. All rights reserved.
//
#ifndef PRIME2000
#ifndef PRIME5000
#import "Specta.h"
#import "FISPrimeTimeTableViewController.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "Swizzlean.h"

SpecBegin(FISPrimeViews)

describe(@"FISPrimeViews", ^{
    __block FISPrimeTimeTableViewController *ptVC;
    
    beforeAll(^{
        [KIFUITestActor setDefaultTimeout:5];
        ptVC = [[FISPrimeTimeTableViewController alloc] init];
    });
    
    beforeEach(^{

    });
    
    describe(@"primeNumber:", ^{
        it(@"returns the prime-th prime number, given which prime number to look for",^{
            expect([ptVC primeNumber:5]).to.equal(11);
            expect([ptVC primeNumber:386]).to.equal(2663);
            expect([ptVC primeNumber:2001]).to.equal(17393);
        });
    });
    
    describe(@"tableview", ^{
        it(@"has 100 cells, with proper prime number textlabel on each cell",^{
            NSIndexPath *ip1 = [NSIndexPath indexPathForRow:0 inSection:0];
            UITableViewCell *cell1 = (UITableViewCell *)[tester waitForCellAtIndexPath:ip1 inTableViewWithAccessibilityIdentifier:@"table"];
            expect(cell1.textLabel.text).to.equal(@"2");
            
            NSIndexPath *ip2 = [NSIndexPath indexPathForRow:49 inSection:0];
            UITableViewCell *cell2 = (UITableViewCell *)[tester waitForCellAtIndexPath:ip2 inTableViewWithAccessibilityIdentifier:@"table"];
            expect(cell2.textLabel.text).to.equal(@"229");
            
            NSIndexPath *ip3 = [NSIndexPath indexPathForRow:99 inSection:0];
            UITableViewCell *cell3 = (UITableViewCell *)[tester waitForCellAtIndexPath:ip3 inTableViewWithAccessibilityIdentifier:@"table"];
            expect(cell3.textLabel.text).to.equal(@"541");
            
            
        });
    });
    
    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
#endif
#endif