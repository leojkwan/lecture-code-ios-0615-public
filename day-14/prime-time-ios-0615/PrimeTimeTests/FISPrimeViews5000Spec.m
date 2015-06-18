//
//  FISPrimeViews5000Spec.m
//  PrimeTime
//
//  Created by Chris Gonzales on 5/15/14.
//  Copyright 2014 FIS. All rights reserved.
//

#ifdef PRIME5000
#import "Specta.h"
#import "FISPrimeTimeTableViewController.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#import "Swizzlean.h"

SpecBegin(FISPrimeViews5000)

describe(@"FISPrimeViews", ^{
    __block FISPrimeTimeTableViewController *ptVC;
    
    beforeAll(^{
        [KIFUITestActor setDefaultTimeout:5];
        ptVC = [[FISPrimeTimeTableViewController alloc] init];
    });
    
    beforeEach(^{
        
    });
    
    describe(@"tableview", ^{
        it(@"has 100 cells, with proper prime number textlabel on each cell",^{
            NSIndexPath *ip1 = [NSIndexPath indexPathForRow:0 inSection:0];
            UITableViewCell *cell1 = (UITableViewCell *)[tester waitForCellAtIndexPath:ip1 inTableViewWithAccessibilityIdentifier:@"table"];
            expect(cell1.textLabel.text).to.equal(@"48619");
            
            NSIndexPath *ip2 = [NSIndexPath indexPathForRow:49 inSection:0];
            UITableViewCell *cell2 = (UITableViewCell *)[tester waitForCellAtIndexPath:ip2 inTableViewWithAccessibilityIdentifier:@"table"];
            expect(cell2.textLabel.text).to.equal(@"49123");
            
            NSIndexPath *ip3 = [NSIndexPath indexPathForRow:99 inSection:0];
            UITableViewCell *cell3 = (UITableViewCell *)[tester waitForCellAtIndexPath:ip3 inTableViewWithAccessibilityIdentifier:@"table"];
            expect(cell3.textLabel.text).to.equal(@"49663");
            
        });
    });
    
    afterEach(^{
        
    });
    
    afterAll(^{
        
    });
});

SpecEnd
#endif