//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func swapFirstElement<T>(var #arrayOne:[T], var #arrayTwo:[T]) -> ([T],[T])
{

    if count(arrayOne) > 3{
        println("Greater than 3")
    }
    let firstElementFromOne = arrayOne[0]
    arrayOne[0] = arrayTwo[0]
    arrayTwo[0] = firstElementFromOne

    return (arrayOne,arrayTwo)

}

class NewArray<T>  {
    let title: T
    let age: Int

    init(title: T) {
        self.title = title
        self.age = 15
    }

}

let myArray = NewArray<String>(title: "Hello")

println(myArray.title)




let myArray = ["joe","bob","Kristine", "Kayla"]
let myArrayTwo = ["frank","jane"]
println(swapFirstElement(arrayOne: myArray, arrayTwo: myArrayTwo))




