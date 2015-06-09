//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person: NSObject {
    let name: String
    var height: Int?

    init(name: String, height: Int) {
        self.name = name
        self.height = height
    }

    convenience init(name: String) {
        self.init(name:name, height:0)
    }

    func grow(extraInches: Int = 1) {
        self.height? += extraInches
    }

}


var joe = Person(name: "Joe", height: 74)
var babyJoe = Person(name: "Joe")

babyJoe.height = 234234
print(joe.height)
print(babyJoe.name)

babyJoe.grow(extraInches: 5)
print(babyJoe.height)


