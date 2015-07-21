---
  tags: tutorial, advanced, Views, UITabBarController  
  languages: objc
---


objc-ViewsInCode
================

##To Storyboard or not to Storyboard? 


###Storyboards
The storyboard makes it incredibly easy to create a visual scaffolding for your application with very little effort.  Apple, in general, recommends using storyboards whenever possible to create visual interfaces, but their vision overlooks the realities for many developers working in teams.  While storyboards offer the advantage of speed and visibility, they also, as you've seen, don't play very nicely with version control systems like Git.  On top of that, building interfaces using a combination of storyboards and code, can make it awkward to reuse views in later projects where both the code and bits of storyboards must be migrated.  

###Nibs 
Nibs (ironically given that they predate the storyboard) offer a partial solution to the issue by working much better with version control and being coupled to a single view.  On the other hand, storyboards and nibs do offer the advantage of being decoupled from many changes that Apple may make in their implementations of visual elements.  In other words, if you create an interface in code and Apple changes their implementation, you'll likely have a lot of work to do to adapt your codebase to the new OS version.  With storyboards and Nibs on the other hand, as long as Apple hasn't removed the element all together, XCode will handle much of the upgrade process for you.  

See me waffling a little bit? The reality is there isn't one answer to how you'll be creating UI after you leave Flatiron School.  Likely, you'll design some interfaces with nibs and xibs, others with storyboards, others 100% in code, and many more using a combination of methods.  

###Code 
Today, my friends, we undertake the unenviable task of building a user interface completely in code.  You shall recreate your iPhone's 'Phone' app whilst fighting the urge to drag-and-drop.  

Fear not, whether you realize it or not, you already know how to do this.  You know how to instantiate objects (alloc] init] ??) you know how to modify their properties and call their designated initializers, and we began the class setting the windows root view controller.  There are some idiosyncrasies with creating interfaces in code, but the documentation is generally very helpful for this purpose.  In the cases where it isn't, StackOverflow is your friend, people have done everything that can be done in the storyboard in code and there is a StackOverflow question for whatever you can't figure out.  

## The Phone App 

The phone app is built on a UITabBarController.  When creating UI in code (and in storyboards for that matter), it's useful to think about the big picture of your apps navigational flow.  In this case, the entire phone app is embedded in a TabBarController, so an instance of a UITabBarController will clearly be the rootview for the application.  

###UITabBarController 

- `@property(nonatomic, copy) NSArray *viewControllers` - The array of view controllers represented by each tab. 

###UINavigationController 

All but one of the ViewControllers in the 'Phone' app is embedded in a Navigation Controller.  You'll want to embed your ViewControllers in Navigation Controllers and add those navigation controllers to your TabBarControllers' viewControllers Array. 

###UIViewController 

- `@property(nonatomic, retain) UITabBarItem *tabBarItem` - View Controllers have a tab bar item property for the tab bar image icons.  Think carefully about where you want to set the tabBarItem. Does it make sense for it to be set in the view controller, should it be done in a TabBarController subclass, or in the App Delegate?

Some tabBarItems for the phone app are actually publically accessible.  see `- (id)initWithTabBarSystemItem:(UITabBarSystemItem)systemItem tag:(NSInteger)tag`.  Others you'll want to use font awesome kit's [ion icon set](https://github.com/PrideChung/FontAwesomeKit) to create. For the voicemail tabBarItem, just find a suitable replacement.    

- `@property(nonatomic, readonly, retain) UINavigationItem *navigationItem` - The UINavigationItem will allow you to set the right and left bar button items.  The phone app uses system and text based barButtonItems, which you'll want to add to the navigationItem. 

###Autolayout

- The Phone App is a portrait only application.  There is actually very little layout in the phone app that is not intrinsically derived (which makes your life much easier).  The major exception to this is the `Keypad` tab.  For the keypad, you should use AutoLayout with visual format language to recreate the grid of buttons.  

##Approach 

The idea here is to get a good sampling of creating different UI Elements in code.  Follow these guidelines to achieve this goal. Your mission is to make this app identical to the `Phone` app one layer deep.  Meaning, it's OK if segues don't work, but each tab should be a clone of the phone app. If you have extra time, move on to some segues.   

- Build the tab bar controller first, add navigation controllers (with tableviews as their root navigation controller) to the tabBarControllers' navigationControllers property.  
- Create UITableViewController subclasses as needed for each of the views (besides Keypad which will just be a UIViewController Subclass)
- Move on to the details, feed in some fake contact data (don't waste your time getting detailed with this or building extensive models, that's not the point of this lab!), add the barButtonItems to the navigation controllers, add the tabBarItems, choose appropriate tableViewCellStyle's (or subclass UITableViewCell if necessary)
- Create the Keypad screen with autolayout 
- Think about how your code can be more compartmentalized. In other words, I **could** set all of the properties for my view controller from the app delegate, but is that the best place for it? 

##Links

- [Apple Documentation](https://developer.apple.com/library/ios/navigation/)
- [Stack Overflow](http://www.stackoverflow.com)
- [Google](http://www.google.com)
- [Easter](http://imgur.com/dAj3fZS)






