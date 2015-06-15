---
  tags: tutorial, intermediate, OOP, Object-Oriented Programming, Navigation 
  languages: objc
---

NavigationControllers
=========

### Goals 

- Learn about segues and destination view controllers 
- Use Navigation Controllers to control View Controller interactions 
 

### Navigation Controllers  

UINavigation Controller provides a method to manage the navigation of hierarchical content.  Often in iOS, we'll have related content that requires the pushing of one view on top of another.  The content in the destination view is often derived from the content that was selected in the master screen.  In this Lab, we'll explore using Navigation controllers to push content from one view to another.  


### Instructions 

In the demo app attached, you will add 3 classes: `TeamMember :NSObject, TeamViewController :UIViewController, and TeamDetailViewController :UIViewController`.  The three classes serve the following functions: 

- TeamMember: TeamMember is a model class that represents each member of your team.  
- TeamViewController: TeamViewController lays out a UIButton with a background image for each of your team members.
- TeamDetailViewController: TeamDetailViewController displays the details for the given team member that was tapped in the TeamViewController
 
1. In the storyboard, cntrl + drag from each button (on the TeamViewController) to the TeamDetailViewController (clicking any button should perform a segue to the TeamDetailViewController).  
2. Make sure to create an identifier for each of your segues! (this will be important later. ) 
3. The action for tapping a button should perform a segue to the detail view controller.  The segue (in performSegueWithIdentifier:) should instantiate the destination view controller (TeamDetailViewController), and set it's teamMember property to the corresponding teamMember that was selected. You can find this by setting the segue identifiers in your storyboard and checking for those identifiers in your prepareForSegue Method.
4. In order for perform segue to work, you'll need to embed TeamViewController in a navigation controller in your storyboard. Do that! 
5. The Team Detail View Controller should set all of it's labels based upon the teamMember object that was passed to it by the TeamViewController.   


### Hints

- The prepareForSegue Method in your TeamViewController should instantiate a new TeamDetailViewController.  After initialization, you'll set the teamDVC's teamMember property equal to the member that corresponds with the tapped UIImageView. You can use the segueWithIdentifier property from within the performSegueWithIdentifier: method to determine which team member should be passed.   


    
