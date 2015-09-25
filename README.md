## SSSegmentedControl
`SSSegmentedControl` is an `UISegmentedControl` 'Extension' written in Objective-C. With this 'Extension' multiple segment selection is easy to use. 
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
* In `Storyboard`select a segmented control and set its custom class to `SSSegmentedControl`
* Define the number of segments; name them; color them; etc.
* Open the `ViewController.h` and connect an Outlet and IBAction to the `SSSegmentedControl`
* Open the `ViewController.m` and add in `viewDidLoad()`:
```
    _sssegmentedControl.segmentSelected = [NSMutableArray new];
    [_sssegmentedControl.segmentSelected addObjectsFromArray:@[@NO,@NO,...]];
    // add @NO for each Segment you have
    _sssegmentedControl.maxActiveSegments = 2;
    // Declare the maximum number of active segments
    _sssegmentedControl.activeSegments = [NSMutableArray new];
    [_sssegmentedControl.activeSegments addObjectsFromArray:@[@0]];
```
* In `IBAction` add:
```
    NSInteger actSegments = [_sssegmentedControl getObjectFromSegmentArrayIndex:0];
    if (sender.selectedSegmentIndex == UISegmentedControlNoSegment) {
        return;
    
    if (! [_sssegmentedControl getSegmentSelectedForIndex:sender.selectedSegmentIndex]) {
        if (! (actSegments < _sssegmentedControl.maxActiveSegments)) {
            [sender setSelectedSegmentIndex:UISegmentedControlNoSegment];
            [_sssegmentedControl colorAllSegmentsFor:sender withColor:[UIColor blueColor]];
            return;
        }
        
        [_sssegmentedControl setSegmentSelected:YES forIndex:sender.selectedSegmentIndex];
        [_sssegmentedControl setTintColorFor:sender ofSegment:sender.selectedSegmentIndex
                                 withColor:[UIColor blueColor]];
        actSegments++;
        [_sssegmentedContro insertObjectIntoSegmentArray:actSegments toIndex:0];
        
        // Methods to call if segment gets selected
        
    } else {
        [_sssegmentedControl setSegmentSelected:NO forIndex:sender.selectedSegmentIndex];
        [_sssegmentedControl setTintColorFor:sender ofSegment:sender.selectedSegmentIndex
                                 withColor:sender.tintColor];
        actSegments--;
        [_sssegmentedControl insertObjectIntoSegmentArray:actSegments toIndex:0];
        [sender setSelectedSegmentIndex:UISegmentedControlNoSegment];
        
        // Methods to call if segment gets deselected
    }

    [_sssegmentedControl2Tabs colorAllSegmentsFor:sender withColor:[UIColor blueColor]];
```
* You are ready to use `SSSegmentedControl`

___
### Questions / Suggestions ?
* Feel free to message me at:
 benedikt.veith@scherer-software.de
    


