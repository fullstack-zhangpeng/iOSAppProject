//
//  UIView+Property.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/9/3.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)setFs_origin:(CGPoint)fs_origin
{
    CGRect frame = self.frame;
    frame.origin = fs_origin;
    self.frame = frame;
}

- (CGPoint)fs_origin
{
    return self.frame.origin;
}

- (void)setFs_size:(CGSize)fs_size
{
    CGRect frame = self.frame;
    frame.size = fs_size;
    self.frame = frame;
}

- (CGSize)fs_size
{
    return self.frame.size;
}

- (void)setFs_top:(CGFloat)fs_top
{
    CGRect frame = self.frame;
    frame.origin.y = fs_top;
    self.frame = frame;
}

- (CGFloat)fs_top
{
    return self.frame.origin.y;
}

- (void)setFs_left:(CGFloat)fs_left
{
    CGRect frame = self.frame;
    frame.origin.x = fs_left;
    self.frame = frame;
}

- (CGFloat)fs_left
{
    return self.frame.origin.x;
}

- (void)setFs_bottom:(CGFloat)fs_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = fs_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)fs_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setFs_right:(CGFloat)fs_right
{
    CGRect frame = self.frame;
    frame.origin.x = fs_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)fs_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setFs_width:(CGFloat)fs_width
{
    CGRect frame = self.frame;
    frame.size.width = fs_width;
    self.frame = frame;
}

- (CGFloat)fs_width
{
    return self.frame.size.width;
}

- (void)setFs_height:(CGFloat)fs_height
{
    CGRect frame = self.frame;
    frame.size.height = fs_height;
    self.frame = frame;
}

- (CGFloat)fs_height
{
    return self.frame.size.height;
}

- (void)setFs_centerX:(CGFloat)fs_centerX
{
    self.center = CGPointMake(fs_centerX, self.center.y);
}

- (CGFloat)fs_centerX
{
    return self.center.x;
}

- (void)setFs_centerY:(CGFloat)fs_centerY
{
    self.center = CGPointMake(self.center.x, fs_centerY);
}

- (CGFloat)fs_centerY
{
    return self.center.y;
}

#pragma mark - Method

- (BOOL)fs_containView:(UIView *)view
{
    if (!self || !view || (self.subviews.count <= 0)) {
        return NO;
    }
    return [[self subviews] containsObject:view];
}

@end
