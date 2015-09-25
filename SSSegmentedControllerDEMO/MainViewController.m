//
//  MainViewController.m
//  SSSegmentedController
//
//  Created by Benedikt Veith on 23/09/15.
//  Copyright © 2015 Benedikt Veith. All rights reserved.
//

#import "MainViewController.h"
#import "SSSegmentedControl.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //All Tabs possible (7)
    _segmentedControl.segmentSelected = [NSMutableArray new];
        // Set for every segment selected to NO
    [_segmentedControl.segmentSelected addObjectsFromArray:@[@NO,@NO,@NO,@NO,@NO,@NO,@NO]];
        // Define max. number of active segments
    _segmentedControl.maxActiveSegments = 7;
    _segmentedControl.activeSegments = [NSMutableArray new];
        // Set activeSegments to 0
    [_segmentedControl.activeSegments addObjectsFromArray:@[@0]];
    
    
    //X-Number of tabs possible (2)
    _segmentedControl2Tabs.segmentSelected = [NSMutableArray new];
        // Set for every segment selected to NO
    [_segmentedControl2Tabs.segmentSelected addObjectsFromArray:@[@NO,@NO,@NO,@NO,@NO]];
        // Define max. number of active segments
    _segmentedControl2Tabs.maxActiveSegments = 2;
    _segmentedControl2Tabs.activeSegments = [NSMutableArray new];
        // Set activeSegments to 0
    [_segmentedControl2Tabs.activeSegments addObjectsFromArray:@[@0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

// IBAction for 7 active segments
- (IBAction)segmentedControlPressed:(SSSegmentedControl *)sender {
    // Get how many segments are currently active
    NSInteger actSegments = [_segmentedControl getObjectFromSegmentArrayIndex:0];
    
    // If no segment selected return
    if (sender.selectedSegmentIndex == UISegmentedControlNoSegment) {
        return;
    }
    
    // If selected segment segmentSelected value is NO
    if (! [_segmentedControl getSegmentSelectedForIndex:sender.selectedSegmentIndex]) {
        // if actSegments is less than maxActiveSegments
        if (! (actSegments < _segmentedControl.maxActiveSegments)) {
            // Select no segment
            [sender setSelectedSegmentIndex:UISegmentedControlNoSegment];
            // Color all segments
            [_segmentedControl colorAllSegmentsFor:sender withColor:[UIColor blueColor]];
            return;
        }
        
        // Set selected segment segmentSelected value to YES
        [_segmentedControl setSegmentSelected:YES forIndex:sender.selectedSegmentIndex];
        // Color it blue
        [_segmentedControl setTintColorFor:sender ofSegment:sender.selectedSegmentIndex
                                 withColor:[UIColor blueColor]];
        // Increase actSegment and safe it
        actSegments++;
        [_segmentedControl insertObjectIntoSegmentArray:actSegments toIndex:0];
        
        
        // Methods to call if segment gets selected
        
    } else {
        // Set selected segment segmentSelected value to NO
        [_segmentedControl setSegmentSelected:NO forIndex:sender.selectedSegmentIndex];
        // Color segment to default color
        [_segmentedControl setTintColorFor:sender ofSegment:sender.selectedSegmentIndex
                                 withColor:sender.tintColor];
        // Decrease actSegments and safe it
        actSegments--;
        [_segmentedControl insertObjectIntoSegmentArray:actSegments toIndex:0];
        // Select no segment
        [sender setSelectedSegmentIndex:UISegmentedControlNoSegment];
        
        
        // Methods to call if segment gets deselected
    }
    
    // Color all segments
    [_segmentedControl colorAllSegmentsFor:sender withColor:[UIColor blueColor]];
}

// IBAction for 2 active segments
- (IBAction)segmentedControl2TabsPressed:(SSSegmentedControl *)sender {
    // Get how many segments are currently active
    NSInteger actSegments = [_segmentedControl2Tabs getObjectFromSegmentArrayIndex:0];
    
    // If no segment selected return
    if (sender.selectedSegmentIndex == UISegmentedControlNoSegment) {
        return;
    }
    
    // If selected segment segmentSelected value is NO
    if (! [_segmentedControl2Tabs getSegmentSelectedForIndex:sender.selectedSegmentIndex]) {
        // if actSegments is less than maxActiveSegments
        if (! (actSegments < _segmentedControl2Tabs.maxActiveSegments)) {
            // Select no segment
            [sender setSelectedSegmentIndex:UISegmentedControlNoSegment];
            // Color all segments
            [_segmentedControl2Tabs colorAllSegmentsFor:sender withColor:[UIColor blueColor]];
            return;
        }
        
        // Set selected segment segmentSelected value to YES
        [_segmentedControl2Tabs setSegmentSelected:YES forIndex:sender.selectedSegmentIndex];
        // Color it blue
        [_segmentedControl2Tabs setTintColorFor:sender ofSegment:sender.selectedSegmentIndex
                                 withColor:[UIColor blueColor]];
        // Increase actSegment and safe it
        actSegments++;
        [_segmentedControl2Tabs insertObjectIntoSegmentArray:actSegments toIndex:0];
        
        
        // Methods to call if segment gets selected
        
    } else {
        // Set selected segment segmentSelected value to NO
        [_segmentedControl2Tabs setSegmentSelected:NO forIndex:sender.selectedSegmentIndex];
        // Color segment to default color
        [_segmentedControl2Tabs setTintColorFor:sender ofSegment:sender.selectedSegmentIndex
                                 withColor:sender.tintColor];
        // Decrease actSegments and safe it
        actSegments--;
        [_segmentedControl2Tabs insertObjectIntoSegmentArray:actSegments toIndex:0];
        // Select no segment
        [sender setSelectedSegmentIndex:UISegmentedControlNoSegment];
        
        
        // Methods to call if segment gets deselected
    }
    
    // Color all segments
    [_segmentedControl2Tabs colorAllSegmentsFor:sender withColor:[UIColor blueColor]];
    

}

// IBAction for 1 active segment
- (IBAction)segmentControl1Tab:(SSSegmentedControl *)sender {
    // Check if selected segment == value; If color segment.
    
    if (sender.selectedSegmentIndex == 0) {
        //Red
        [_segmentControl1Tab setTintColorFor:sender ofSegment:sender.selectedSegmentIndex withColor:[UIColor redColor]];
    } else if (sender.selectedSegmentIndex == 1) {
        //Blue
        [_segmentControl1Tab setTintColorFor:sender ofSegment:sender.selectedSegmentIndex withColor:[UIColor blueColor]];
    } else if (sender.selectedSegmentIndex == 2) {
        //Green
        [_segmentControl1Tab setTintColorFor:sender ofSegment:sender.selectedSegmentIndex withColor:[UIColor greenColor]];
    } else if (sender.selectedSegmentIndex == 3) {
        //Yellow
        [_segmentControl1Tab setTintColorFor:sender ofSegment:sender.selectedSegmentIndex withColor:[UIColor yellowColor]];
    }
}


@end
