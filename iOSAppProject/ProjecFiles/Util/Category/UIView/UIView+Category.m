//
//  UIView+Property.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/9/3.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)setPb_origin:(CGPoint)pb_origin
{
    CGRect frame = self.frame;
    frame.origin = pb_origin;
    self.frame = frame;
}

- (CGPoint)pb_origin
{
    return self.frame.origin;
}

- (void)setPb_size:(CGSize)pb_size
{
    CGRect frame = self.frame;
    frame.size = pb_size;
    self.frame = frame;
}

- (CGSize)pb_size
{
    return self.frame.size;
}

- (void)setPb_top:(CGFloat)pb_top
{
    CGRect frame = self.frame;
    frame.origin.y = pb_top;
    self.frame = frame;
}

- (CGFloat)pb_top
{
    return self.frame.origin.y;
}

- (void)setPb_left:(CGFloat)pb_left
{
    CGRect frame = self.frame;
    frame.origin.x = pb_left;
    self.frame = frame;
}

- (CGFloat)pb_left
{
    return self.frame.origin.x;
}

- (void)setPb_bottom:(CGFloat)pb_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = pb_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)pb_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setPb_right:(CGFloat)pb_right
{
    CGRect frame = self.frame;
    frame.origin.x = pb_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)pb_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setPb_width:(CGFloat)pb_width
{
    CGRect frame = self.frame;
    frame.size.width = pb_width;
    self.frame = frame;
}

- (CGFloat)pb_width
{
    return self.frame.size.width;
}

- (void)setPb_height:(CGFloat)pb_height
{
    CGRect frame = self.frame;
    frame.size.height = pb_height;
    self.frame = frame;
}

- (CGFloat)pb_height
{
    return self.frame.size.height;
}

- (void)setPb_centerX:(CGFloat)pb_centerX
{
    self.center = CGPointMake(pb_centerX, self.center.y);
}

- (CGFloat)pb_centerX
{
    return self.center.x;
}

- (void)setPb_centerY:(CGFloat)pb_centerY
{
    self.center = CGPointMake(self.center.x, pb_centerY);
}

- (CGFloat)pb_centerY
{
    return self.center.y;
}

#pragma mark - Method

- (BOOL)pb_containView:(UIView *)view
{
    if (!self || !view || (self.subviews.count <= 0)) {
        return NO;
    }
    return [[self subviews] containsObject:view];
}

@end
