//
//  UIView+Category.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/9/3.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

#pragma mark - Property

/// Shortcut for frame.origin.
@property (nonatomic, assign) CGPoint pb_origin;
/// Shortcut for frame.size.
@property (nonatomic, assign) CGSize pb_size;
/// Shortcut for frame.origin.y
@property (nonatomic, assign) CGFloat pb_top;
/// Shortcut for frame.origin.x.
@property (nonatomic, assign) CGFloat pb_left;
/// Shortcut for frame.origin.y + frame.size.height
@property (nonatomic, assign) CGFloat pb_bottom;
/// Shortcut for frame.origin.x + frame.size.width
@property (nonatomic, assign) CGFloat pb_right;
/// Shortcut for frame.size.width.
@property (nonatomic, assign) CGFloat pb_width;
/// Shortcut for frame.size.height.
@property (nonatomic, assign) CGFloat pb_height;
/// Shortcut for center.x
@property (nonatomic, assign) CGFloat pb_centerX;
/// Shortcut for center.y
@property (nonatomic, assign) CGFloat pb_centerY;

#pragma mark - Method

- (BOOL)pb_containView:(UIView *)view;

@end
