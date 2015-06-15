//
//#import "Specta.h"
//#import "TeamDetailViewController.h"
//#define EXP_SHORTHAND
//#import "Expecta.h"
//#import "KIF.h"
//#import "Swizzlean.h"
//
//SpecBegin(NavigationControllers)
//
//describe(@"NavigationControllersSpec", ^{
//
//    describe(@"Tapping a person's image should segue to a detail view controller", ^{
//        
//        it(@"Should present an Al", ^{
//            
//            [tester tapViewWithAccessibilityLabel:@"alImage"];
//            
//            UINavigationController *nav = (UINavigationController *)[[[UIApplication sharedApplication].delegate window] rootViewController];
//            nav.navigationItem.leftBarButtonItem.accessibilityLabel = @"nav";
//            
//            TeamDetailViewController *teamDVC = (TeamDetailViewController *)nav.topViewController;
//            
//            expect(teamDVC.teamMember).toNot.beNil();
//            expect(teamDVC.teamMember).to.beKindOf([TeamMember class]);
//            expect(teamDVC.teamMember.name).to.equal(@"Al");
//            expect(teamDVC.teamMember.phoneNumber).to.equal(@"5551212");
//            expect(teamDVC.teamMember.birthCity).to.equal(@"Detroit");
//            expect(teamDVC.teamMember.birthState).to.equal(@"Michigan");
//            expect(teamDVC.teamMember.favoriteBand).to.equal(@"The Beatles");
//        });
//    });
//});
//
//SpecEnd