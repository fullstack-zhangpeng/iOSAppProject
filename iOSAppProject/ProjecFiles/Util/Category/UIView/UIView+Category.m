//
//  UIView+Property.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/9/3.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)setP_origin:(CGPoint)p_origin {
    CGRect frame = self.frame;
    frame.origin = p_origin;
    self.frame = frame;
}

- (CGPoint)p_origin {
    return self.frame.origin;
}

- (void)setP_size:(CGSize)p_size {
    CGRect frame = self.frame;
    frame.size = p_size;
    self.frame = frame;
}

- (CGSize)p_size {
    return self.frame.size;
}

- (void)setP_top:(CGFloat)p_top {
    CGRect frame = self.frame;
    frame.origin.y = p_top;
    self.frame = frame;
}

- (CGFloat)p_top {
    return self.frame.origin.y;
}

- (void)setP_left:(CGFloat)p_left {
    CGRect frame = self.frame;
    frame.origin.x = p_left;
    self.frame = frame;
}

- (CGFloat)p_left {
    return self.frame.origin.x;
}

- (void)setP_bottom:(CGFloat)p_bottom {
    CGRect frame = self.frame;
    frame.origin.y = p_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)p_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setP_right:(CGFloat)p_right {
    CGRect frame = self.frame;
    frame.origin.x = p_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)p_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setP_width:(CGFloat)p_width {
    CGRect frame = self.frame;
    frame.size.width = p_width;
    self.frame = frame;
}

- (CGFloat)p_width {
    return self.frame.size.width;
}

- (void)setP_height:(CGFloat)p_height {
    CGRect frame = self.frame;
    frame.size.height = p_height;
    self.frame = frame;
}

- (CGFloat)p_height {
    return self.frame.size.height;
}

- (void)setP_centerX:(CGFloat)p_centerX {
    self.center = CGPointMake(p_centerX, self.center.y);
}

- (CGFloat)p_centerX {
    return self.center.x;
}

- (void)setP_centerY:(CGFloat)p_centerY {
    self.center = CGPointMake(self.center.x, p_centerY);
}

- (CGFloat)p_centerY {
    return self.center.y;
}

#pragma mark - Method

- (BOOL)p_containView:(UIView *)view {
    if (!self || !view || (self.subviews.count <= 0)) {
        return NO;
    }
    return [[self subviews] containsObject:view];
}

@end
