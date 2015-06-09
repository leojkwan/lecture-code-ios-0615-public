---
  tags: arrays, dictionaries, optionals, conditionals, loops
  languages: swift
---

# Dinner Options

### Skills: iteration, arrays, dictionaries, optionals

## Instructions


####Part 1

Create a `MenuItem` object which has the following properties:

1) a name, which can change

2) a recipe, which is really just a dictionary of ingredients (strings) as keys and the associated amount of that ingredient needed as values.

Neither the name or recipe for a `MenuItem` can ever be nil.

Write a designated initializer for a MenuItem.



####Part 2

Create a `Restaurant` class which has the following properties:

1) the `name` of the restaurant

2) the `cuisine` of the restaurant

3) the `supplies` on hand at the restaurant, which is a `Dictionary` of ingredients (strings) as keys and their amounts as values

4) the `owner` of the restaurant, which is a `Person` object

5) the `menu` for the restaurant 

6) the restaurants current list of `orders`, which even if there are none should exist. This is a dictionary where the key is the table number and the value is an array of `MenuItem` objects.

Only the `menu` of the restaurant can ever be `nil`, since some restaurants don't have menus.

Now write methods that do the following:

1) An initializer that includes the `name` of the restaurant, its `cuisine`, and its `owner`.

2) Place an order. This method should take an `array` of `string` objects (the order as given by the customer) and a `tableNumber` and add the completed `order` to the `orders` property. It should only add to the order if what was requested is on the restaurant's menu.

3) Make an order. This method should take a table number as an argument. It should look for the associated order placed for that table in the `orders` dictionary, and return the completed order (an `array` of `menuItem` objects), assuming that the restaurant has all of the necessary ingredients on hand to make the order. If the restaurant does not have the necessary amount of ingredients on hand to cook a specific `menuItem` ordered, it should return a partially completed order, and print in our console the `menuItem` objects for which it did not have the full ingredients on hand to make.



####Part 3

Create a `Person` object which has the following properties:

1) the person's `name`

2) the person's `cuisinePreferences` (an `Array` of `String` objects)

3) the person's `restaurantOwned` (a `Restaurant` if they own one)


`restaurantOwned` may be nil.

This class should also include the following methods.

1) An initializer that includes the name of the person and their cuisine preferences.

2) A convenience initializer with just the person's name, if they have no cuisine preferences.

3) A function which chooses a place to eat from a list of restaurants based on the following rules:
-- If the person owns a restaurant, they are going to go to that restaurant. In this case, the function will return that restaurant and print something along the following lines in our console: 

"Since Tom own's Tom's Restaurant, we are obviously going there."

-- If a person has cuisine preferences, they will go to the first restaurant in the list of restaurants provided which matches one of their cuisine preferences. In this case the function will return that restaurant, and print something alone the following lines in our console:

"George would like to go to Tom's Restaurant"

-- If a person has cuisine preferences, but they do not match any of the restaurants in the supplied list, the function will return nil, and print something along the following lines in our console:

"Elaine can't find a restaurant that fits his or her preferences."

-- And if a person does not have any cuisine preferences, the function will return nil, and print something along the following lines in our console:

"Newman doesn't care where we go to eat."



####Part 4

Finally, you will write a function where you see fit that will `displayMenuForPreferredRestaurantOfDiner`. This function will take a `Person` object as an argument. It will have them choose a restaurant and then print the menu of this restaurant in the console, if they choose one.

In order to test all of this out, we have provided some test data in the following method below. You can implement this in your AppDelegate.

If you loop through calling the `displayMenuForPreferredRestaurantOfDiner` method, the output should reflect the following using the test data (since there are no tests in this lab, this will help you see if you've done it correctly):

######Console Output
```
Elaine can't find a restaurant that fits his or her preferences.

Jerry would like to go to Alice's Restaurant

Their menu includes:
1) Grilled Cheese

2) Vegetable Soup

George would like to go to Tom's Restaurant

Their menu includes:
1) Tuna on Toast

2) Pea Soup

Since Tom own's Tom's Restaurant, we are obviously going there.

Their menu includes:
1) Tuna on Toast

2) Pea Soup

Since Alice own's Alice's Restaurant, we are obviously going there.

Their menu includes:
1) Grilled Cheese

2) Vegetable Soup

Newman doesn't care where we go.
```

######Test Data Method
```swift
func generateTestData() {
    
    var alice = Person(name: "Alice", cuisinePreferences: ["French", "Italian", "American"])
    
    var grilledCheese = MenuItem(name: "Grilled Cheese", recipe: ["Cheese" : 2, "Bread": 2])
    var vegetableSoup = MenuItem(name: "Vegetable Soup", recipe: ["Beefstake Tomato" : 2, "White Onion" : 1, "8 oz can lima beans" : 1, "Idaho Potato": 1, "Garlic clove": 1])
    var alicesMenu = [grilledCheese: 8.99, vegetableSoup: 4.99]
    
    let alicesRestaurant = Restaurant(name: "Alice's Restaurant", cuisine: "American", owner: alice)
    
    alicesRestaurant.supplies = ["Cheese": 10, "Bread": 7, "Beefstake Tomato": 9, "White Onion" : 3, "8 oz can lima beans" : 3, "Idaho Potato" : 10, "Garlic clove" : 16];
    alice.restaurantOwned = alicesRestaurant        
    alicesRestaurant.menu = alicesMenu
    
    var tom = Person(name: "Tom")
    
    var tunaSandwich = MenuItem(name: "Tuna on Toast", recipe: ["Tuna": 1, "Bread" : 2, "Lettuce" : 2])
    
    var peaSoup = MenuItem(name: "Pea Soup", recipe: ["Peas": 1, "Soup" : 2])
    
    let tomsRestaurant = Restaurant(name: "Tom's Restaurant", cuisine: "Coffee", owner: tom)
    
    tom.restaurantOwned = tomsRestaurant
    var tomsMenu = [tunaSandwich: 10.99, peaSoup: 5.99]
    
    tomsRestaurant.menu = tomsMenu
    
    tomsRestaurant.supplies = ["Tuna" : 3, "Bread" : 12, "Lettuce": 4, "Peas" : 5, "Soup" : 11]
    
    var george = Person(name: "George", cuisinePreferences: ["Coffee", "American"])
    
    var jerry = Person(name: "Jerry", cuisinePreferences: ["French", "American"])
    
    var elaine = Person(name: "Elaine", cuisinePreferences: ["Spanish", "French"])
    
    var newman = Person(name: "Newman")
    
    self.people = [elaine, jerry, george, tom, alice, newman]
    self.restaurants = [tomsRestaurant, alicesRestaurant]
    
}
```

You may also find this little bit of code helpful at some point...

######Potentially useful code
```swift
 var table10Order = ["Pea Soup", "Pea Soup", "Pea Soup", "Pea Soup", "Grilled Cheese", "Tuna on Toast"]
 
 var table5Order = ["Vegetable Soup", "Vegetable Soup", "Grilled Cheese"]
 
 var table2Order = ["Grilled Cheese", "Grilled Cheese"]
 
 var table3Order = ["Grilled Cheese", "Vegetable Soup", "Vegetable Soup", "Vegetable Soup"]
```

###Advanced

There should be a retain cycle in the code you just wrote (if you didn't already remove it.) Look up online how to easily remove it (Hint: It should require just adding one word to your code, and the word is not "weak".)



