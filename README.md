## SSSegmentedControl
`SSSegmentedControl` is an `UISegmentedControl` 'Extension' written in Objective-C. With this 'Extension' multiple segment selection is available. 
___
### Features:
* Easy to color active / selected segments
* Declare the maximum allowed number of active segments
* Deselection enabled
* Deselected segments always have the default color declared in storyboard

___
### Technical Requirements:
* iOS 7.0 and above

___
### License:
* `SSSegmentedControl` is licensed under the **MIT** License, please check License file.

___
### Using:
* In `Storyboard`select a segmented control and set its custom class to `SSSegmentedControl`.
* Define the number of segments; name them; color them; etc.
* Open the `ViewController.h` and connect an Outlet and IBAction to the `SSSegmentedControl`.
* Open the `ViewController.m` and add in `viewDidLoad()`:
```
[_segmentedControl setupSSSegmentedControlWithNumberOfSegments:'Number of Segments' withMaxActiveSegments:'Max Active Segments' andWithActiveColor:'Color'];
```
* Chose max. active segments = 0, to use default segmented control features / options.
* In the `IBAction` add:
```
[_segmentedControl segmentedControlActionWithSelectedSegmentAction:@selector('Method for selected segment':) andDeselectedAction:@selector('Method for deselected segment':) andTarget:self];
```
* At last define an Method / Function for selected segment and deselected segment and connect them above with the selectors.
* Pay attention! : ```-(void)methodNameForSelected/DeselectedSegment:(SSSegmentedControl*)sender ```!

___
### Questions / Suggestions ?
* Check out the Demo Project for documented methods !
* Feel free to message me at:
 benedikt.veith@scherer-software.de
    


