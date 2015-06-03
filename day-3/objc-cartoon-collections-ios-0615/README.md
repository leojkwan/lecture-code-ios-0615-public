---
tags: arrays, beginner, methods
language: objc
---

# Val's Cartoons

## Submitting This Lab

  1. Fork the lab.
  2. Work with the person next to you, or people around you. No more than 3 to a group.
  3. When you are done submit a single pull-request for your team back to the main repo on flatiron-school-students
  4. Include in the pull-request description who you worked with!
  5. [Celebrate!](https://www.youtube.com/watch?v=StTqXEQ2l-Y&feature=kp)

## Instructions

  1. Write `rollCallDwarves:(NSArray *)dwarves`. This method should take in an NSArray of dwarves and returns a roll call sheet with their number. I'd recommend using a standard `for` loop for this. This is a roll call sheet for HUMANS so please start counting at 1. For example given the following array:

  ```
  @[@"Doc",@"Dopey",@"Bashful"]
  ```

  return an `NSMutableString` that looks like this:

  ```
  1. Doc | 2. Dopey | 3. Bashful
  ```

  2. Write the `summonCaptainPlanet:(NSArray *)planeteerCalls` method. This method should take an `NSArray` of forces. These forces a bit lackluster...let's give them some hart and make them all caps and an exclamation point after to show we really mean it! Return another `NSArray` with a capitalized and exclamation point after. So for example the following `NSArray`:

  ```
  @[@"earth",@"wind"]
  ```

  would turn into:

  ```
  @[@"EARTH!", @"WIND!"]
  ```

  3. Write the `longPlaneteerCalls:(NSArray *)planeteerCalls` method. The planeteerCalls are supposed to be short so let's find out if any of our planeteerCalls have more than 4 characters. This method takes in a list of planeteerCalls and returns the list of planeteerCalls that have more then 4 characters. So for example the following `NSArray`:

  ```
  @[@"earth",@"wind"]
  ```

  would return:

  ```
  @[@"earth"]
  ```

  4. Write the `findTheCheese:(NSArrray *)cheeses` method. This method should look through the `NSArray` of `NSString`s and find the first string that matches one of the following cheese strings: `@"cheddar", @"gouda", or @"camembert"`. It should then return the `NSString` of the resulting search. If it doesn't find anything, return `nil`.

  5. Write the `calculateDollarAmountsWithReceipt:(NSArray *)receipt` method. This method should keep help someone keep track of their money. Sadly...people keep their receipts in a weird way. They keep in them in an `NSArray` that looks like this:

  ```
  @[@"$$", @"$", @"$$$"]
  ```

  So this method takes an array like that in, and should return another array converted to monetary values (As `NSString`) So the previous `NSArray` would turn into this:

  ```
  @[@"$2",@"$1",@"$3"]
  ```

## Resources

  * [Loops](https://mobileappmastery.com/objective-c-loops/)
  * [Appending Strings](http://www.idev101.com/code/Objective-C/Strings/concat.html)
