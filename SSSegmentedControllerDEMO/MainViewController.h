//
//  MainViewController.h
//  SSSegmentedController
//
//  Created by Benedikt Veith on 23/09/15.
//  Copyright © 2015 Benedikt Veith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSSegmentedControl.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet SSSegmentedControl *segmentedControl;
- (IBAction)segmentedControlPressed:(SSSegmentedControl *)sender;

- (IBAction)segmentedControl2TabsPressed:(SSSegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet SSSegmentedControl *segmentedControl2Tabs;

- (IBAction)segmentControl1Tab:(SSSegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet SSSegmentedControl *segmentControl1Tab;

@end
