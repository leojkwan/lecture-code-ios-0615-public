//
//  Restaurant.swift
//  DinnerOptions
//
//  Created by Joe Burgess on 6/8/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

import UIKit

class Restaurant: NSObject {
    let name: String
    let cuisine: String
    var supplies: [String : Int]
    let owner: Person
    var menu: [MenuItem]
    var orders: [Int : [MenuItem]]

    init(name: String, cuisine: String, owner: Person) {
        self.name = name
        self.cuisine = cuisine
        self.owner = owner
        self.supplies = [:]
        self.menu = []
        self.orders = [:]

    }

    func placeOrder(orders: [MenuItem], tableNumber: Int) {

        var inMenu = true

        var orderSet = Set(orders)
        var menuSet = Set(menu)

//        for order in orders {
//            for item in menu {
//                if order != item {
//                    inMenu = false
//                }
//            }
//        }

        if (orderSet.subtract(menuSet) == Set()) {
            self.orders[tableNumber] = orders
        }

    }

    func makeOrder(tableNumber: Int) -> [MenuItem]?{
        var completedOrders: [MenuItem] = []

        print(orders[tableNumber]?[0].name)

        if let tableOrder = orders[tableNumber] {
             completedOrders = tableOrder
        } else {
            return nil
        }

        return completedOrders

    }

}
