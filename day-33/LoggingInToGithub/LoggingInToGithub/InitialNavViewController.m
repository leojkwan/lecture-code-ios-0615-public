//
//  InitialNavViewController.m
//  LoggingInToGithub
//
//  Created by Timothy Clem on 7/15/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "InitialNavViewController.h"
#import <AFOAuth2Manager/AFOAuth2Manager.h>

@interface InitialNavViewController ()

@end

@implementation InitialNavViewController

-(void)viewWillAppear:(BOOL)animated
{
    AFOAuthCredential *credential = [AFOAuthCredential retrieveCredentialWithIdentifier:@"githubauth"];

    if(credential) {
        // we are logged in!
        [self performSegueWithIdentifier:@"InitialToReposSegueID" sender:nil];
    }
    else {
        [self performSegueWithIdentifier:@"InitialToLogInSegueID" sender:nil];
    }
}

@end
