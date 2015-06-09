//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var receipt = [34.23, 43.23,65.2,58.10]

var englishReceipt: [String] = []
for item in receipt {
    englishReceipt.append("$\(item)")
}

print(englishReceipt)


func dollarSignAdder(item: Double) -> String {
    return "$\(item)"
}

//let englishReceipt2 = receipt.map {dollarSignAdder($0)}


//print(englishReceipt2)


let expensiveReceipt = receipt.filter {$0>40.0}

print(expensiveReceipt)


var sum: Double = 0.0

for item in receipt {
    sum = sum + item
}

let sumTotal = receipt.reduce(0.0, combine: { (left, right) -> Double in
    return left + right
})




