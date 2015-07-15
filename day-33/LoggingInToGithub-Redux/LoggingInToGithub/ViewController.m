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


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // register notifications

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleApplicationOpenedForURL:) name:@"ApplicationOpenedForURL" object:nil];

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleAppEnteringBackgroundNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

-(NSString *)firstValueForQueryItemNamed:(NSString *)name inURL:(NSURL *)url
{
    NSURLComponents *urlComps = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:nil];
    NSArray *queryItems = urlComps.queryItems;

    for(NSURLQueryItem *queryItem in queryItems) {
        if([queryItem.name isEqualToString:name]) {
            return queryItem.value;
        }
    }

    return nil;
}

-(void)handleApplicationOpenedForURL:(NSNotification *)notification
{
    NSLog(@"In the VC notification center observer thingy: %@", notification);

    NSURL *url = notification.userInfo[@"url"];

    NSString *code = [self firstValueForQueryItemNamed:@"code" inURL:url];


    NSURL *baseURL = [NSURL URLWithString:@"https://github.com/"];
    AFOAuth2Manager *OAuth2Manager =
    [[AFOAuth2Manager alloc] initWithBaseURL:baseURL
                                    clientID:@"fbfb11ed462f0be0f462"
                                      secret:@"b6803370e510dd46fa4f55a6fe718ed7b1cc0da0"];

    OAuth2Manager.useHTTPBasicAuthentication = NO;

    [OAuth2Manager authenticateUsingOAuthWithURLString:@"/login/oauth/access_token" code:code redirectURI:@"" success:^(AFOAuthCredential *credential) {
        NSLog(@"Success! Credential: %@", credential);

        [AFOAuthCredential storeCredential:credential
                            withIdentifier:@"githubauth"];

        [self updateUserName];
    } failure:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    // unregister notifications so we're not called while our view is invisible

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ApplicationOpenedForURL" object:nil];
}


-(void)updateUserName {
    AFOAuthCredential *credential = [AFOAuthCredential retrieveCredentialWithIdentifier:@"githubauth"];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setAuthorizationHeaderFieldWithCredential:credential];

    self.label.text = @"Fetching user name...";

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
