//: Playground - noun: a place where people can play

import UIKit

let str = "Hello, playground"



print(str)


let pi = 3.14

let isClassInSession = true

var myArray = ["hello","joe", 3.14]

myArray = ["hi"]

myArray.append("!")

var myStringArray: NSArray = ["joe", "hello"]

let myAlphaSorter = NSSortDescriptor(key: "self", ascending: true)

myStringArray.sortedArrayUsingDescriptors([myAlphaSorter])


// NSArray *myStringArray = @[@"hello",@"joe"]

var height: Double = 72
height = 72.5


let joe = ["name": "Joe Burgess",
    34: "74"]





func printDescription(name: String?, hairColor: String, eyeColor: String) -> String?
{

    // if name != nil{ strictName = name!}
    if let name = name
    {
        return name.uppercaseString
    }
    return nil

}
































