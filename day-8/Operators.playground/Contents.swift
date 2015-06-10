//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

println("Asdf")

println(508)

// 5 * 6 * 5
// (5 * 6) * 5
// 5 * 4 * 3 * 2
// ((5 * 4) * 3) * 2


infix operator ** { associativity left precedence 180 }

func ** (left: Double, right: Double) -> Double {
    return pow(left, right)
}

println(5**2)

key convertToJson value