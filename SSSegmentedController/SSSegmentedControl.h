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

@property NSMutableArray *activeSegments;
@property NSMutableArray *segmentSelected;
@property NSInteger maxActiveSegments;

/**
 *  Insert active segments amount
 *
 *  @param segment Active segment amount
 *  @param index   Index position
 */
- (void)insertObjectIntoSegmentArray:(NSInteger)segment toIndex:(NSInteger)index;

/**
 * Get active segments
 *
 *  @param index Index position
 *
 *  @return Active segments
 */
- (NSInteger)getObjectFromSegmentArrayIndex:(NSInteger)index;

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
