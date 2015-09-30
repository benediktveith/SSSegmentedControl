//
//  MainViewController.m
//  SSSegmentedController
//
//  Created by Scherer Software on 23/09/15.
//  Copyright © 2015 Scherer Software. All rights reserved.
//

#import "MainViewController.h"
#import "SSSegmentedControl.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Init SegmentedControl for 7 max. active tabs
    [_segmentedControl setupSSSegmentedControlWithNumberOfSegments:7 withMaxActiveSegments:7 andWithActiveColor:[UIColor blueColor]];
    
    // Init SegmentedControl for 2 max. active tabs
    [_segmentedControl2Tabs setupSSSegmentedControlWithNumberOfSegments:5 withMaxActiveSegments:2 andWithActiveColor:[UIColor blueColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectedSegment:(SSSegmentedControl*)sender {
    NSLog(@"Selected %ld", (long)sender.selectedSegmentIndex);
}

- (void)deselectedSegment:(SSSegmentedControl*)sender {
    NSLog(@"Deselected %ld", (long)sender.selectedSegmentIndex);
}

#pragma mark - IBActions

// IBAction for 7 active segments
- (IBAction)segmentedControlPressed:(SSSegmentedControl *)sender {
    [_segmentedControl segmentedControlActionWithSelectedSegmentAction:@selector(selectedSegment:)
                                                   andDeselectedAction:@selector(deselectedSegment:) andTarget:self];
}

// IBAction for 2 active segments
- (IBAction)segmentedControl2TabsPressed:(SSSegmentedControl *)sender {
    [_segmentedControl2Tabs segmentedControlActionWithSelectedSegmentAction:@selector(selectedSegment:) andDeselectedAction:@selector(deselectedSegment:) andTarget:self];
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
