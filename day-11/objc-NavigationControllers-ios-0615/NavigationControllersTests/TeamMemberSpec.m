//
//#import "Specta.h"
//#import "TeamMember.h"
//#define EXP_SHORTHAND
//#import "Expecta.h"
//#import "KIF.h"
//#import "Swizzlean.h"
//
//SpecBegin(TeamMember)
//
//__block TeamMember *defTesterMember;
//__block TeamMember *designatedTesterMember;
//__block UIImage *alImage;
//describe(@"TeamMember", ^{
//
//    beforeEach(^{
//        alImage = [UIImage imageNamed:@"al.jpg"];
//        
//        defTesterMember = [[TeamMember alloc] init];
//        designatedTesterMember = [[TeamMember alloc] initWithName:@"Al"
//                                                      phoneNumber:@"555-1212"
//                                                        birthCity:@"Detroit"
//                                                       birthState:@"Michigan"
//                                                     favoriteBand:@"The Beatles"
//                                                            image:alImage];
//    });
//    
//    describe(@"Initializer", ^{
//        it(@"should have an init", ^{
//            expect(defTesterMember).to.respondTo(@selector(init));
//            expect(defTesterMember).to.beKindOf([TeamMember class]);
//        });
//        it(@"should set properties to default values ", ^{
//            expect(defTesterMember.name).to.equal(@"");
//            expect(defTesterMember.phoneNumber).to.equal(@"");
//            expect(defTesterMember.birthCity).to.equal(@"");
//            expect(defTesterMember.birthState).to.equal(@"");
//            expect(defTesterMember.favoriteBand).to.equal(@"");
//            
//            pending(^{ //techinically this doesn't work because each UIImage has a different memeory address so we'll omit this test by wrapping in a pending block 
//                expect(defTesterMember.image).to.equal([UIImage new]);
//            });
//        });
//    });
//
//    describe(@"Designated initializer", ^{
//        
//        it(@"should have a designated init", ^{
//            expect(designatedTesterMember).to.respondTo(@selector(initWithName:phoneNumber:birthCity:birthState:favoriteBand:image:));
//            expect(designatedTesterMember).to.beKindOf([TeamMember class]);
//        });
//        
//        it(@"should set properties with designated init", ^{
//            expect(designatedTesterMember.name).to.equal(@"Al");
//            expect(designatedTesterMember.phoneNumber).to.equal(@"555-1212");
//            expect(designatedTesterMember.birthCity).to.equal(@"Detroit");
//            expect(designatedTesterMember.birthState).to.equal(@"Michigan");
//            expect(designatedTesterMember.favoriteBand).to.equal(@"The Beatles");
//            expect(designatedTesterMember.image).to.equal(alImage);
//        });
//    });
//});
//
//SpecEnd