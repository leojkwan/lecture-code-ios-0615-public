//
//  MyWebViewController.m
//  ProtocolsAndDelegates
//
//  Created by Timothy Clem on 6/23/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "MyWebViewController.h"

@interface MyWebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIWebView *otherWebView;

@end

@implementation MyWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.webView.delegate = self;
    self.otherWebView.delegate = self;

//    [self respondsToSelector:@selector(webView:didFailLoadWithError:)]

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://flatironschool.com"]]];

    [self.otherWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ask.com"]]];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if(webView == self.otherWebView) {
        NSLog(@"The bottom webview is navigating");
    }
    else {
        NSLog(@"The top view is navigating");
    }

    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
