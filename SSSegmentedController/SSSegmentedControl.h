//
//  SSSegmentedControl.h
//  SSSegmentedController
//
//  Created by Scherer Software on 21/09/15.
//  Copyright © 2015 Scherer Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSSegmentedControl : UISegmentedControl

@property NSArray *sortedSubViews;

@property NSInteger activeSegments;
@property NSMutableArray *segmentSelected;
@property NSInteger maxActiveSegments;

/**
 *  Colors, Select and Deselect segment, also calls method for selected / deselected segment
 *
 *  @param segmentSelectedAction   Method for selected segment
 *  @param segmentDeselectedAction Method for deselected segment
 *  @param target                  Target which contains the methods
 */
- (void)segmentedControlActionWithSelectedSegmentAction:(SEL)segmentSelectedAction
                                    andDeselectedAction:(SEL)segmentDeselectedAction andTarget:(id)target;

/**
 *  Setup SSSegmentedControl
 *
 *  @param numberOfSegments Number of Segments (Must be correct!)
 *  @param maxActSegments   Max. allowed active segments
 *  @param newColor         Color of active segments
 */
- (void)setupSSSegmentedControlWithNumberOfSegments:(NSInteger)numberOfSegments
                              withMaxActiveSegments:(NSInteger)maxActSegments andWithActiveColor:(UIColor*)newColor;

/**
 *  Insert active segments amount
 *
 *  @param segment Active segment amount
 *  @param index   Index position
 */
- (void)insertObjectIntoActiveSegments:(NSInteger)segment;

/**
 * Get active segments
 *
 *  @param index Index position
 *
 *  @return Active segments
 */
- (NSInteger)getActiveSegmentsNumber;

/**
 *  Colors segment to newColor
 *
 *  @param sender   Which UISegmentedControl segment get colored
 *  @param index    Segment ID
 *  @param newColor New color
 */
- (void)recolorSegmentsFor:(UISegmentedControl*)sender ofSegment:(NSInteger)index withColor:(UIColor*)newColor;

/**
 *  Set tint color of current active segment
 *
 *  @param sender   Which UISegmentedControl
 *  @param index    Segment ID
 *  @param newColor New color
 */
- (void)setTintColorFor:(UISegmentedControl*)sender ofSegment:(NSInteger)index withColor:(UIColor*)newColor;

/**
 *  Reset the color to default of segment
 *
 *  @param sender Which UISegmentedControl
 *  @param index  Segment ID
 */
- (void)resetColorsFor:(UISegmentedControl*)sender ofSegment:(NSInteger)index;

/**
 *  Change the value of segmentSelected to YES / NO
 *
 *  @param selected YES or NO
 *  @param index    Segment ID
 */
- (void)setSegmentSelected:(BOOL)selected forIndex:(NSInteger)index;

/**
 *  Get if segment is selected
 *
 *  @param index Segment ID
 *
 *  @return YES or NO
 */
- (BOOL)getSegmentSelectedForIndex:(NSInteger)index;

/**
 *  Color all segments (selected and deselected ones)
 *
 *  @param sender Which UISegmentedControl
 *  @param newColor Color for active segments
 */
- (void)colorAllSegmentsFor:(UISegmentedControl*)sender withColor:(UIColor*)newColor;

@end
