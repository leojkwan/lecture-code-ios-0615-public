---
tags: OOP, properties, methods
language: objc
---

## Learning Goals
  1. Learn how Objects work
  2. Get better with Objective-C

## Requirements
  1. Create a new Person Class.  Person should be an NSObject subclass.  
  2. Add all of the required properties to the Person class 
  3. Implement all of the required methods in the Person class 

### Person

#### About Properties
Properties provide a way to create instance variables and accessor methods (getters and setters) in a single step.  Say for instance we created a class called cats.  If Cats has a property (of type NSNumber) numberOfLegs, the cat class will automatically, behind the scenes generate two methods for us: 

```objc 

 - (NSNumber *)numberOfLegs; // getter
 - (void)setNumberOfLegs:(NSNumber *)numberOfLegs; // setter

```

We can use these methods to both set and get our class's properties.  Let's say we create a Cat 'myCat' in our AppDelegates' didFinishLaunchingWithOptions method.  We can set the cats number of legs and get the cats number of legs using the following code.  

```objc

 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
   Cat *myCat = [[Cat alloc] init];
  
   [myCat setNumberOfLegs:@4]; //sets number of legs 
   NSNumber *numLegs = [myCat numberOfLegs]; // gets myCat's numberOfLegs and assigns it to a local variable 'numLegs'
 }

```

But it gets better! Objective-C allows us to use dot notation to both get and set properties.  I could (and in fact should), write the above code like this: 

```objc
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
   Cat *myCat = [[Cat alloc] init];
  
   myCat.numberOfLegs = @4; //sets number of legs 
   NSNumber *numLegs = myCat.numberOfLegs; // gets myCat's numberOfLegs and assigns it to a local variable 'numLegs'
 }
```

Last, remember that the classes you make are just like any other class such as `NSString` or `NSNumber`. You can add them to arrays like this:

```
NSMutableArray *myArray = [[NSMutableArray alloc] init];
Cat *myCat = [[Cat alloc] init];

[myArray addObject:myCat];
```

Then we can get the cats the same way we are used to with arrays

```
Cat *retreivedCat = myArray[0];
```

#### Properties 
Create the following properties in Person.h.  

  1. ```(NSNumber *)height```
  2. ```(NSNumber *)age```
  3. ```(NSString *)name```
  4. ```(BOOL) isFemale```
  5. ```(NSMutableArray *)friends```

ex. 
```objc
 @interface Person : NSObject 

 @property (strong, nonatomic) NSNumber *height;
 @property (nonatomic) BOOL isFemale; // notice how primitives are declared a little differently than objects 

 @end
```

#### Methods
  1. ```- (NSNumber *)grow;```
    * Based on age/gender, grow a random amount of inches.
    * If it's a girl with age < 11 grow between 0 and 1 inch, age >= 11 and <=15 grow .5 to 2 inches. >15 grow 0 inches
    * If it's a boy with age < 12 grow between 0 and 1 inch, age >=12 and <=16 grow .5-3.5 inches. >16 grow 0 inches
  2. ```- (void)addFriends:(NSArray *)friends;```
    * Add the elements of the passed in `NSArray` to our `friends` property.
  3. ```- (NSString *)generatePartyList;```
    * Generate a list of friends for an upcoming party. It should look like this: `@"eric, chris, al, avi, adam"`
  4. ```- (BOOL)removeFriend: (Person *)friend;```
    * Remove that friend from the array.
    * Return `YES` or `NO` if they were found or not found

##### Extra Credit

  5. ```- (NSArray *)removeFriends: (NSArray *)friends;```
    * Remove the friends listed in the passed in argument from our current `friends` property.
    * Return an array of friends who were found and removed

#### Playing with your methods in the AppDelegate

Feel free to play with your new class outside of the tests in the AppDelegate. Here is a reminder how.

  1. Import the Person class in the AppDelegate's .m 
  2. In didFinishLaunchingWithOptions, instantiate a new Person. ie. ```Person *al = [[Person alloc] init];```  
  3. Set the person's age, height, name, and isFemale properties using dot notation.  ie. ```al.height = @72;``` 
  4. Test each of the required methods and NSLog the output.  ie. ```NSLog(@"%@",[al grow]) // ex output 76;```
  5. Create a few additional Person objects to test addFriends ie. ```[al addFriends:@[jon, chris, sally]]; //assuming i already created jon, chris and sally.  

## Hints 

Here is a helper method for random floats 

```objc
#define ARC4RANDOM_MAX 0x100000000
- (CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX)
    * (maxRange - minRange)
    + minRange;
}
```

Check out the documentation on NSMutableArray (Help -> Documentation and API Refrences).  NSMutableArray has some great methods ie. addObject, addObjectsFromArray, removeObject, removeObjectsFromArray 


