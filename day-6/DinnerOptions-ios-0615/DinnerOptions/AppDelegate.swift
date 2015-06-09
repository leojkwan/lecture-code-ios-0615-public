//
//  AppDelegate.swift
//  DinnerOptions
//
//  Created by Zachary Drossman on 11/24/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var people = [Person]()
    var restaurants = [Restaurant]()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.generateTestData()
        
        
        
        // Override point for customization after application launch.
        return true
    }

    
    func generateTestData() {
        
//        var alice = Person(name: "Alice", cuisinePreferences: ["French", "Italian", "American"])
//        
//        var grilledCheese = MenuItem(name: "Grilled Cheese", recipe: ["Cheese" : 2, "Bread": 2])
//        var vegetableSoup = MenuItem(name: "Vegetable Soup", recipe: ["Beefstake Tomato" : 2, "White Onion" : 1, "8 oz can lima beans" : 1, "Idaho Potato": 1, "Garlic clove": 1])
//        var alicesMenu = [grilledCheese: 8.99, vegetableSoup: 4.99]
//        
//        let alicesRestaurant = Restaurant(name: "Alice's Restaurant", cuisine: "American", owner: alice)
//        
//        alicesRestaurant.supplies = ["Cheese": 10, "Bread": 7, "Beefstake Tomato": 9, "White Onion" : 3, "8 oz can lima beans" : 3, "Idaho Potato" : 10, "Garlic clove" : 16];
//        
//        alicesRestaurant.menu = alicesMenu
//        
//        var tom = Person(name: "Tom")
//        
//        var tunaSandwich = MenuItem(name: "Tuna on Toast", recipe: ["Tuna": 1, "Bread" : 2, "Lettuce" : 2])
//        
//        var peaSoup = MenuItem(name: "Pea Soup", recipe: ["Peas": 1, "Soup" : 2])
//        
//        let tomsRestaurant = Restaurant(name: "Tom's Restaurant", cuisine: "Coffee", owner: tom)
//
//        var tomsMenu = [tunaSandwich: 10.99, peaSoup: 5.99]
//        
//        tomsRestaurant.menu = tomsMenu
//        
//        tomsRestaurant.supplies = ["Tuna" : 3, "Bread" : 12, "Lettuce": 4, "Peas" : 5, "Soup" : 11]
//        
//        var george = Person(name: "George", cuisinePreferences: ["Coffee", "American"])
//        
//        var jerry = Person(name: "Jerry", cuisinePreferences: ["French", "American"])
//        
//        var elaine = Person(name: "Elaine", cuisinePreferences: ["Spanish", "French"])
//        
//        self.people = [elaine, jerry, george, tom, alice]
//        self.restaurants = [tomsRestaurant, alicesRestaurant]

    }

    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

