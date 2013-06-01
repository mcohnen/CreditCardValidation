//
//  UIView+snap.h
//  Snap
//
//  Created by Miguel Cohnen de la Cámara on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(MC)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

- (void)startFrameChanges;
- (void)commitFrameChanges;

- (UIView *)centerHV;
- (UIView *)centerV;
- (UIView *)centerH;
- (UIView *)bottomV;

- (void)removeAllSubviews;

- (void)zoomOutSwitch:(UIView *)view;
- (void)zoomInSwitch:(UIView *)view;

- (UIImage *)snapshot;
- (UIImage *)snapshot:(CGRect)rect;
- (UIImage *)snapshot:(CGRect)rect quality:(float)quality;
- (UIImage *)snapshot:(CGRect)rect quality:(float)quality opaque:(BOOL)opaque;

+ (UIView *)findFirstResponder:(UIView *)view;

- (id)findFirstAncestorKindOf:(Class)aClass;
- (void)applyBlockDescendants:(void (^)(UIView *view))block;

@end
