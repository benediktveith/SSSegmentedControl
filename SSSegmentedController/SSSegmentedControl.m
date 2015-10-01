//
//  SSSegmentedControl.m
//  SSSegmentedController
//
//  Created by Scherer Software on 21/09/15.
//  Copyright © 2015 Scherer Software. All rights reserved.
//

#import "SSSegmentedControl.h"

@interface SSSegmentedControl ()

@property UIColor *activeSegmentColor;

@end

@implementation SSSegmentedControl

#pragma mark - Setup SSSegmentedControl

- (void)setupSSSegmentedControlWithNumberOfSegments:(NSInteger)numberOfSegments
                              withMaxActiveSegments:(NSInteger)maxActSegments andWithActiveColor:(UIColor*)newColor {
    
    _segmentSelected = [NSMutableArray new];
    for (int i = 0; i < numberOfSegments; i++) {
        [_segmentSelected addObjectsFromArray:@[@NO]];
    }
    
    _activeSegmentColor = newColor;
    _activeSegments = 0;
    _maxActiveSegments = maxActSegments;
}

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

- (void)segmentedControlActionWithSelectedSegmentAction:(SEL)segmentSelectedAction
                                    andDeselectedAction:(SEL)segmentDeselectedAction andTarget:(id)target {
    // Get how many segments are currently active
    NSInteger actSegments = [self getActiveSegmentsNumber];
    
    // If no segment selected return
    if (self.selectedSegmentIndex == UISegmentedControlNoSegment) {
        return;
    }
    
    if (_maxActiveSegments == 0) {
        [self colorAllSegmentsFor:self withColor:_activeSegmentColor];
        return;
    }
    
    // If selected segment segmentSelected value is NO
    if (! [self getSegmentSelectedForIndex:self.selectedSegmentIndex]) {
        // if actSegments is not less than maxActiveSegments
        if (! (actSegments < _maxActiveSegments)) {
            // Select no segment
            [self setSelectedSegmentIndex:UISegmentedControlNoSegment];
            // Color all segments
            [self colorAllSegmentsFor:self withColor:_activeSegmentColor];
            return;
        }
        
        // Set selected segment segmentSelected value to YES
        [self setSegmentSelected:YES forIndex:self.selectedSegmentIndex];
        // Color it blue
        [self setTintColorFor:self ofSegment:self.selectedSegmentIndex
                                 withColor:_activeSegmentColor];
        // Increase actSegment and safe it
        actSegments++;
        [self insertObjectIntoActiveSegments:actSegments];

        // perform action for selected segment
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:segmentSelectedAction withObject:self];
#pragma clang diagnostic pop
    
    } else {
        // perfrom action for deselected segment
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:segmentDeselectedAction withObject:self];
#pragma clang diagnostic pop
        
        // Set selected segment segmentSelected value to NO
        [self setSegmentSelected:NO forIndex:self.selectedSegmentIndex];
        // Color segment to default color
        [self setTintColorFor:self ofSegment:self.selectedSegmentIndex
                                 withColor:self.tintColor];
        // Decrease actSegments and safe it
        actSegments--;
        [self insertObjectIntoActiveSegments:actSegments];
        
        // Select no segment
        [self setSelectedSegmentIndex:UISegmentedControlNoSegment];
    }
    
    // Color all segments
    [self colorAllSegmentsFor:self withColor:_activeSegmentColor];
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

#pragma mark - SegmentedControls


#pragma mark - Color Segments

- (void)colorAllSegmentsFor:(UISegmentedControl*)sender withColor:(UIColor*)newColor {
    if (_maxActiveSegments == 0) {
        for (NSInteger index = 0; index < sender.numberOfSegments; index++) {
            if (index == sender.selectedSegmentIndex) {
                [self setTintColorFor:self ofSegment:index withColor:newColor];
            } else {
                [self resetColorsFor:sender ofSegment:index];
            }
        }
        return;
    }
    
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

#pragma mark - Check Segment

- (BOOL)getSegmentSelectedForIndex:(NSInteger)index {
    return [[_segmentSelected objectAtIndex:index] boolValue];
}

- (NSInteger)getActiveSegmentsNumber {
    return _activeSegments;
}

- (UIColor*)getSegmentColor {
    return _activeSegmentColor;
}

#pragma mark - Update Segment

- (void)setNewColorForSegment:(UIColor*)newColor {
    _activeSegmentColor = newColor;
}

- (void)setSegmentSelected:(BOOL)selected forIndex:(NSInteger)index {
    [_segmentSelected replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:selected]];
}

- (void)insertObjectIntoActiveSegments:(NSInteger)segment {
    _activeSegments = segment;
}

@end
