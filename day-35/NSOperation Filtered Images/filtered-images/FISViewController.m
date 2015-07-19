//
//  FISViewController.m
//  filtered-images
//
//  Created by Joe Burgess on 7/23/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import "UIImage+Filters.h"
#import <MBProgressHUD.h>
#import "FISImageProcessingOperation.h"
#import "FISTimerOperation.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)vignetterTapped:(id)sender;

@property (nonatomic, strong) FISTimerOperation *timerOperation;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView.image = [UIImage imageNamed:@"Mickey.jpg"];
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)invertButtonTapped:(id)sender {
    self.timerOperation = [[FISTimerOperation alloc] init];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [queue addOperation:self.timerOperation];
}

- (IBAction)sepiaButtonTapped:(id)sender {
    [self.timerOperation cancel];
}

- (IBAction)vignetterTapped:(id)sender {

    UIImage *nonFiltered = [UIImage imageNamed:@"Mickey.jpg"];
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    FISImageProcessingOperation *operation = [[FISImageProcessingOperation alloc] init];
    operation.originalImage = nonFiltered;
    operation.filterType = UIImageFilterTypeColorInvert;
    operation.filterCompletionBlock = ^(UIImage *filteredImage) {
        self.imageView.image = filteredImage;
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    };
    
//    operation.completionBlock = ^{
//        // grab the filtered image
//        // on the main thread, set the image on the image view
//        
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            self.imageView.image = operation.filteredImage;
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//        }];
//    };
    
    [operationQueue addOperation:operation];
    
    
//    [operationQueue addOperationWithBlock:^{
//        
//        NSLog(@"Hi.");
//        
//        UIImage *filtered = [nonFiltered imageWithFilter:UIImageFilterTypeVignette];
//
//        
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            
//            NSLog(@"In main queue, jim.");
//            
//            
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            
//            self.imageView.image = filtered;
//            
//        }];
//        
//        
//        NSLog(@"Does this call first, jim?");
//        
//    }];
    
    
    
//    UIImage *filtered = [nonFiltered imageWithFilter:UIImageFilterTypeVignette];
//    self.imageView.image = filtered;
}
@end
