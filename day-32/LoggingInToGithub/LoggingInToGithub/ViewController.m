//
//  ViewController.m
//  LoggingInToGithub
//
//  Created by Timothy Clem on 7/14/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFOAuth2Manager/AFOAuth2Manager.h>
#import <AFOAuth2Manager/AFHTTPRequestSerializer+OAuth2.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(IBAction)doneButtonTapped:(id)sender
{
    AFOAuthCredential *credential = [AFOAuthCredential retrieveCredentialWithIdentifier:@"githubauth"];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setAuthorizationHeaderFieldWithCredential:credential];

    [manager GET:@"https://api.github.com/user" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"Success! %@", responseObject);
        NSDictionary *userDict = responseObject;

        self.label.text = userDict[@"name"];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(IBAction)logInButtonTapped:(id)sender
{
    // send the user to the github URL in safari
    // wait for that response
    // do the thing via AFOAuthManager or whatevs to get the access token

    NSMutableString *authURLString = [@"https://github.com/login/oauth/authorize" mutableCopy];
    [authURLString appendString:@"?client_id=fbfb11ed462f0be0f462"];
    [authURLString appendString:@"&redirect_uri=my-github-app://oauth"];

    NSURL *url = [NSURL URLWithString:authURLString];

    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
