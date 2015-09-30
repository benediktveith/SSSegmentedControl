//
//  SSSegmentedControl.m
//  SSSegmentedController
//
//  Created by Scherer Software on 21/09/15.
//  Copyright © 2015 Scherer Software. All rights reserved.
//

#import "SSSegmentedControl.h"

@interface SSSegmentedControl ()



@end

@implementation SSSegmentedControl

#pragma mark - Override Functions

/**
 *  Called when touch on SegmentedControl ended
 *
 *  Override function:
 *  Check if touch is on active Segment, if so sent Action to tell SegmentedControl the value changed
 *
 *  @param touches
 *  @param event
 */
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent*)event {
    NSInteger current = self.selectedSegmentIndex;
    [super touchesEnded:touches withEvent:event];
    if (current == self.selectedSegmentIndex) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark - Order SubViews

/**
 *  Order Subviews from left to right
 *  So selectedSegmentIndex matches subviewsIndex
 */
- (void)reorderSubViews {
    _sortedSubViews = [NSArray new];
    
    _sortedSubViews = [self.subviews sortedArrayUsingFunction:sortViewsByOrigin context:nil];
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    for (UIView *view in _sortedSubViews) {
        [self addSubview:view];
    }
}

NSInteger static sortViewsByOrigin(id sp1, id sp2, void *context) {
    float v1 = ((UIView *)sp1).frame.origin.x;
    float v2 = ((UIView *)sp2).frame.origin.x;
    if (v1 < v2)
        return NSOrderedAscending;
    else if (v1 > v2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}


#pragma mark - Color Segments

- (void)colorAllSegmentsFor:(UISegmentedControl*)sender withColor:(UIColor*)newColor {
    for (NSInteger index = 0; index < _segmentSelected.count; index++) {
        if (! (index == sender.selectedSegmentIndex)) {
            if ([self getSegmentSelectedForIndex:index]) {
                [self recolorSegmentsFor:sender ofSegment:index withColor:newColor];
            } else {
                [self resetColorsFor:sender ofSegment:index];
            }
        }
    }
}

- (void)recolorSegmentsFor:(UISegmentedControl*)sender ofSegment:(NSInteger)index withColor:(UIColor*)newColor {
    [self reorderSubViews];
    
    [sender.subviews objectAtIndex:index].tintColor = [UIColor whiteColor];
    [sender.subviews objectAtIndex:index].backgroundColor = newColor;
}

- (void)resetColorsFor:(UISegmentedControl*)sender ofSegment:(NSInteger)index {
    [self reorderSubViews];
    
    [sender.subviews objectAtIndex:index].tintColor = sender.tintColor;
    [sender.subviews objectAtIndex:index].backgroundColor = sender.backgroundColor;
}

- (void)setTintColorFor:(UISegmentedControl*)sender ofSegment:(NSInteger)index withColor:(UIColor*)newColor {
    [self reorderSubViews];
    
    [sender.subviews objectAtIndex:index].tintColor = newColor;
}

#pragma mark - Check SegmentArrays

- (BOOL)getSegmentSelectedForIndex:(NSInteger)index {
    return [[_segmentSelected objectAtIndex:index] boolValue];
}

- (NSInteger)getObjectFromSegmentArrayIndex:(NSInteger)index {
    return [[_activeSegments objectAtIndex:index] integerValue];
}

#pragma mark - Update SegmentArrayIndex

- (void)setSegmentSelected:(BOOL)selected forIndex:(NSInteger)index {
    [_segmentSelected replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:selected]];
}

- (void)insertObjectIntoSegmentArray:(NSInteger)segment toIndex:(NSInteger)index {
    [_activeSegments replaceObjectAtIndex:index withObject:[NSNumber numberWithInteger:segment]];
}

@end
