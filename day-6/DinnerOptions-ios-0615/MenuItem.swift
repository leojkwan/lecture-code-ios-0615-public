//
//  MenuItem.swift
//  DinnerOptions
//
//  Created by Joe Burgess on 6/8/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

import UIKit

class MenuItem: NSObject {

    var name: String
    var recipe: [String : Int]

    init(name: String, recipe: [String : Int])
    {
        self.name = name
        self.recipe = recipe
    }
   
}
