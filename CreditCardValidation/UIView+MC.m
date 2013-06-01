//
//  UIView+snap.m
//  Snap
//
//  Created by Miguel Cohnen de la Cámara on 4/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIView+MC.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@implementation UIView(MC)

static NSString *TMP_FRAME_ON_IDENTIFIER = @"TMP_FRAME_ON_IDENTIFIER";
static NSString *TMP_FRAME_IDENTIFIER = @"TMP_FRAME_IDENTIFIER";

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)left {
    CGRect frame = self.tmpFrameON?self.tmpFrame:self.frame;
    return frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeft:(CGFloat)x {
    if (self.tmpFrameON) {
        CGRect frame = self.tmpFrame;
        frame.origin.x = x;
        self.tmpFrame = frame;
    } else {
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top {
    CGRect frame = self.tmpFrameON?self.tmpFrame:self.frame;
    return frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop:(CGFloat)y {
    if (self.tmpFrameON) {
        CGRect frame = self.tmpFrame;
        frame.origin.y = y;
        self.tmpFrame = frame;
    } else {
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)right {
    CGRect frame = self.tmpFrameON?self.tmpFrame:self.frame;
    return frame.origin.x + frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setRight:(CGFloat)right {
    if (self.tmpFrameON) {
        CGRect frame = self.tmpFrame;
        frame.origin.x = right - frame.size.width;
        self.tmpFrame = frame;
    } else {
        CGRect frame = self.frame;
        frame.origin.x = right - frame.size.width;
        self.frame = frame;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)bottom {
    CGRect frame = self.tmpFrameON?self.tmpFrame:self.frame;
    return frame.origin.y + frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBottom:(CGFloat)bottom {
    if (self.tmpFrameON) {
        CGRect frame = self.tmpFrame;
        frame.origin.y = bottom - frame.size.height;
        self.tmpFrame = frame;
    } else {
        CGRect frame = self.frame;
        frame.origin.y = bottom - frame.size.height;
        self.frame = frame;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)width {
    CGRect frame = self.tmpFrameON?self.tmpFrame:self.frame;
    return frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setWidth:(CGFloat)width {
    if (self.tmpFrameON) {
        CGRect frame = self.tmpFrame;
        frame.size.width = width;
        self.tmpFrame = frame;
    } else {
        CGRect frame = self.frame;
        frame.size.width = width;
        self.frame = frame;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)height {
    CGRect frame = self.tmpFrameON?self.tmpFrame:self.frame;
    return frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHeight:(CGFloat)height {
    if (self.tmpFrameON) {
        CGRect frame = self.tmpFrame;
        frame.size.height = height;
        self.tmpFrame = frame;
    } else {
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)origin {
    return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)size {
    return self.frame.size;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (UIView *)centerH {
    if (self.superview) {
        self.left = (self.superview.width - self.width)/2;
    }
    return self;
}

- (UIView *)centerV {
    if (self.superview) {
        self.top = (self.superview.height - self.height)/2;
    }
    return self;
}

- (UIView *)bottomV {
    if (self.superview) {
        self.top = self.superview.height - self.height;
    }
    return self;
}

- (UIView *)centerHV {
    if (self.superview) {
        self.top = (self.superview.height - self.height)/2;
        self.left = (self.superview.width - self.width)/2;
    }
    return self;
}

- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)zoomInSwitch:(UIView *)view {
    view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    view.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(1.25, 1.25);
        self.alpha = 0;
        view.transform = CGAffineTransformIdentity;
        view.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)zoomOutSwitch:(UIView *)view {
    view.transform = CGAffineTransformMakeScale(1.25, 1.25);
    view.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(0.8, 0.8);
        self.alpha = 0;
        view.transform = CGAffineTransformIdentity;
        view.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (UIImage *)snapshot:(CGRect)rect quality:(float)quality opaque:(BOOL)opaque {
    if (rect.size.width <= 0 || rect.size.height <= 0) {
        return nil;
    }
    // Get Image
    UIGraphicsBeginImageContextWithOptions(rect.size, opaque, quality);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, -rect.origin.x, -rect.origin.y);
    CGContextClipToRect(ctx, CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height));
    
    [self.layer renderInContext:ctx];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshot;
}

- (UIImage *)snapshot:(CGRect)rect {
    return [self snapshot:rect quality:[UIScreen mainScreen].scale];
}

- (UIImage *)snapshot {
    return [self snapshot:CGRectMake(0, 0, self.width, self.height)];
}

- (UIImage *)snapshot:(CGRect)rect quality:(float)quality {
    return [self snapshot:rect quality:quality opaque:NO];
}

+ (UIView *)findFirstResponder:(UIView *)view {
    if (view.isFirstResponder) {
        return view;
    }
    for (UIView *v in view.subviews) {
        UIView *ret = [self findFirstResponder:v];
        if (ret) {
            return ret;
        }
        
    }
    return nil;
}

- (id)findFirstAncestorKindOf:(Class)aClass {
    UIView *ret = self;
    while (![ret isKindOfClass:aClass]) {
        ret = ret.superview;
        if (!ret) {
            return nil;
        }
    }
    return ret;
}

- (void)applyBlockDescendants:(void (^)(UIView *view))block {
    NSMutableArray *queue = [[NSMutableArray alloc] initWithArray:self.subviews];
    while (queue.count > 0) {
        UIView *view = [queue objectAtIndex:0];
        block(view);
        [queue removeObjectAtIndex:0];
        [queue addObjectsFromArray:view.subviews];
    }
}

- (void)setTmpFrame:(CGRect)frame {
    objc_setAssociatedObject(self, &TMP_FRAME_IDENTIFIER, [NSValue valueWithCGRect:frame], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setTmpFrameON:(BOOL)on {
    objc_setAssociatedObject(self, &TMP_FRAME_ON_IDENTIFIER, [NSNumber numberWithBool:on], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)tmpFrameON {
    return [objc_getAssociatedObject(self, &TMP_FRAME_ON_IDENTIFIER) boolValue];
}

- (CGRect)tmpFrame {
    return [objc_getAssociatedObject(self, &TMP_FRAME_IDENTIFIER) CGRectValue];
}

- (void)startFrameChanges {
    self.tmpFrameON = YES;
    self.tmpFrame = self.frame;
}

- (void)commitFrameChanges {
    if (self.tmpFrameON) {
        self.frame = self.tmpFrame;
        self.tmpFrameON = NO;
    }
}

@end
