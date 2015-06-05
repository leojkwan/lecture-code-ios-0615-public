# Fibonacci Finder

## Goals

1. Create an algorithm using loops, conditionals, and arrays.
2. (Advanced) Create the same algorithm using recursion.

## Introduction 

Programmers often utilize mathematical concepts, proofs, and algorithms to give themselves direction in writing an exercise. For this exercise, we're going to challenge ourselves to write a method that will calculate any number along the Fibonacci Sequence.

The Fibonacci Sequence is defined by the formula:

F<sub>n</sub> = F<sub>n-1</sub> + F<sub>n-2</sub>

with the accepted seed values as either:

F<sub>0</sub> = 0, F<sub>1</sub> = 1, or

F<sub>1</sub> = 1, F<sub>2</sub> = 1

and begins:

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144 ...

What the above information means is that, following the two intial values (in our case, `0` and `1`), each number is the sum of the two numbers preceding it in the sequence. If `0` is the zeroeth number (**Hint:** remember that arrays start at index `0`), then the first number is `1`, the second number is `0 + 1 = 1`, the third `1 + 1 = 2`, the fourth `2 + 3 = 5`, the fifth `3 + 5 = 8`, and so on into infinity.

Don't get intimidated by the math! Whether or not you recall learning about the Fibonacci Sequence in high school or college math class—if you've ever seen a snail shell or a pine cone you're already familiar with it. One of the amazing aspects of the Fibonacci Sequence (and of much of mathematics as a whole) is how prevalent it can be found in nature. Snail shells follow the Fibonacci Spiral (a geometric representation of the number sequence), while pine cones and sun flowers display the shape of Vogel's model (which relies on numbers in the Fibonacci Sequence).

Take a moment now (or save it for a study break later) to read about the history of the Fibonacci Sequence (its oldest known anthropological roots are actually in Sanskrit prosidy in India dating as far back as 200 BC) and look at some nature photography detailing Fibonacci geometry. If you're interested in some numerology, Arthur Benjamin's TED Talk is a six-minute video detailing how the Fibonacci Spiral and the Golden Ratio (1.618033...) are derived from the sequence.
 
Overview & history on [Wikipedia] (http://en.wikipedia.org/wiki/Fibonacci_number)

Photography: [InspirationGreen](http://www.inspirationgreen.com/fibonacci-sequence-in-nature.html)

TED Talk (6 min 25 sec): [Arthur Benjamin](https://www.youtube.com/watch?v=SjSHVDfXHQ4)


## Instructions

  1. Open the `*.xcworkspace` file in the lab's folder. (This lab includes frameworks for the tests which aren't directly included in the `*.xcodeproj` file, so make sure to use the workspace! You should see two blue icons in the navigator window labled "FiboFinder" and "Pods". We'll teach you all about using Cocoa Pods later in the course, but for now just make sure that you see them).
  2. Write an instance method in `FISFiboFinder` titled `fibonacciNumberAtIndex:` that takes in one `NSUInteger` as an argument and returns an `NSUInteger` result. (**HINT:** the argument integer is equivalent to the *n* in the Fibonacci formula, and the result integer is *n*'s value.)
  3. Take a look at the unit tests. These are the files in the "FiboFinderTests" folder named `<#className#>Spec`. It's totally normal for these files to still look confusing, but try to get a sense of understanding the expected results for the input values.
  4. Run the tests by pressing `⌘U`. If any of them fail, try rewriting your `fibonacciNumberAtIndex:` method so that they pass. Ask for help if you get stuck!


## Advanced
1. Create a new Cocoa Touch Class titled `FISFiboFinderAdvanced` which inherits from NSObject. Declare the instance method `fibonacciNumberAtIndex:` for this class. It should also take one `NSUInteger` as an argument and return an `NSUInteger`.

2. To prepare for the next step, 
	- go to your test target `FiboFinderTests` and find the Build Settings. 
	- Type `preprocessor macros` into the search bar in the upper right corner. 
	- Double-click on the line containing the `Preprocessor Macros` label.
	- Press the `+` button in the lower left corner of this box and type in `ADVANCED`. (**NOTE:** The attached image incorrectly reads `PRIME2000` because it is from a later lab. Type in `ADVANCED` for this lab.)
![preprocessor_skitch](http://ironboard-curriculum-content.s3.amazonaws.com/iOS/preprocessor_macro_ss2.png)
3. Write out the method body for `fibonacciNumberAtIndex:` which returns the Nth number of the fibonacci sequence using recursion instead of a loop.
