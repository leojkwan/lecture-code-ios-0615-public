////
////  FISViewSpec.m
////  HellaCells
////
////  Created by Chris Gonzales on 5/13/14.
////  Copyright 2014 FIS. All rights reserved.
////
//
//#import "Specta.h"
//#define EXP_SHORTHAND
//#import "Expecta.h"
//#import "KIF.h"
//#import "Swizzlean.h"
//#import "FISHellaDetailViewController.h"
//#import "FISHellaMasterTableViewController.h"
//
//
//
//SpecBegin(FISView)
//
//describe(@"integration tests", ^{
//    
//    beforeAll(^{
//
//    });
//    
//    beforeEach(^{
//
//    });
//    
//    it(@"should have 100 cells, each with the correct number", ^{
//        for(int x = 0; x < 5; x++)
//        {
//            NSInteger randomRow =1 + arc4random()%100;
//            NSIndexPath *ip = [NSIndexPath indexPathForRow:randomRow inSection:0];
//            UITableViewCell *cell = [tester waitForCellAtIndexPath:ip inTableViewWithAccessibilityIdentifier:@"Table"];
//            NSString *correctString = [NSString stringWithFormat:@"%d", randomRow+1];
//            expect(cell.textLabel.text).to.equal(correctString);
//        }
//    });
//    
//    it(@"should present a detail view with the correct number in a large font",^{
//        NSInteger randomRow = 1 + arc4random()%100;
//        NSIndexPath *ip = [NSIndexPath indexPathForRow:randomRow inSection:0];
//        
//        [tester tapRowAtIndexPath:ip inTableViewWithAccessibilityIdentifier:@"Table"];
//        UILabel *label = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"bigNumber"];
//        
//        expect(label.text).to.equal([NSString stringWithFormat:@"%d", randomRow+1]);
//        expect(label.font.pointSize).to.beGreaterThanOrEqualTo(50.0f);
//        
//    });
//    
//    afterEach(^{
//
//    });
//    
//    afterAll(^{
//
//    });
//});
//
//SpecEnd
