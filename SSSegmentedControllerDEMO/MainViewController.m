//
//  MainViewController.m
//  SSSegmentedController
//
//  Created by Scherer Software on 23/09/15.
//  Copyright © 2015 Scherer Software. All rights reserved.
//  Credits for Icons: 'http://icondock.com/wp-content/themes/icondock/images/preview-product/simplybold.png '

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

    // Init SegmentedControl for Icon tabs
    [_segmentedControlIcon setupSSSegmentedControlWithNumberOfSegments:3 withMaxActiveSegments:3 andWithActiveColor:[UIColor brownColor]];

    // Init SegmentedControl for 1 max. active tab; Use maxActiveSegments = 0 for normal SegmentedControl features!
    [_segmentControl1Tab setupSSSegmentedControlWithNumberOfSegments:4 withMaxActiveSegments:0 andWithActiveColor:[UIColor blueColor]];
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
    [_segmentedControl2Tabs segmentedControlActionWithSelectedSegmentAction:@selector(selectedSegment:)
                                                        andDeselectedAction:@selector(deselectedSegment:) andTarget:self];
}

// IBAction for 1 active segment
- (IBAction)segmentControl1Tab:(SSSegmentedControl *)sender {
    UIColor *segmentColor;
    
    if (sender.selectedSegmentIndex == 0) {
        segmentColor = [UIColor redColor];
    } else if (sender.selectedSegmentIndex == 1) {
        segmentColor = [UIColor blueColor];
    } else if (sender.selectedSegmentIndex == 2) {
        segmentColor = [UIColor greenColor];
    } else if (sender.selectedSegmentIndex == 3) {
        segmentColor = [UIColor yellowColor];
    }
    
    [_segmentControl1Tab setNewColorForSegment:segmentColor];
    [_segmentControl1Tab segmentedControlActionWithSelectedSegmentAction:@selector(selectedSegment:)
                                                     andDeselectedAction:@selector(deselectedSegment:) andTarget:self];
}

// IBAction for Icon segments
- (IBAction)segmentedControlIcons:(SSSegmentedControl *)sender {
    [_segmentedControlIcon segmentedControlActionWithSelectedSegmentAction:@selector(selectedSegment:)
                                                        andDeselectedAction:@selector(deselectedSegment:) andTarget:self];
}

@end
