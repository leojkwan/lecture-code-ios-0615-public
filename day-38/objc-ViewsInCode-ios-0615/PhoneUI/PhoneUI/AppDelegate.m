//
//  AppDelegate.m
//  PhoneUI
//
//  Created by Timothy Clem on 7/21/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "AppDelegate.h"
#import "PhoneTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    CGRect deviceFrame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:deviceFrame];

    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];


//    UIViewController *dummyVC = [[UIViewController alloc] init];
//    dummyVC.view.backgroundColor = [UIColor magentaColor];
//    dummyVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];


    UITabBarController *tabBarController = [[UITabBarController alloc] init];


    tabBarController.viewControllers = @[ [self sectionWithSystemItem:UITabBarSystemItemFavorites title:@"Favorites"],
                                          [self sectionWithSystemItem:UITabBarSystemItemRecents title:@"Recents"],
                                          [self sectionWithSystemItem:UITabBarSystemItemContacts title:@"Contacts"]
                                         ];

    self.window.rootViewController = tabBarController;


    return YES;
}

-(UINavigationController *)sectionWithSystemItem:(UITabBarSystemItem)itemType title:(NSString *)title
{
    // navigation controller has a table view as its initial VC

    UINavigationController *navController = [[UINavigationController alloc] init];

    PhoneTableViewController *tableVC = [[PhoneTableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableVC.title = title;

    navController.viewControllers = @[ tableVC ];

    navController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:itemType tag:0];

    return navController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
