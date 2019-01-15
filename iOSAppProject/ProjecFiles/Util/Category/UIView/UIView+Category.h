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

@property (nonatomic, assign) CGPoint p_origin;      ///< Shortcut for frame.origin.
@property (nonatomic, assign) CGSize  p_size;        ///< Shortcut for frame.size.
@property (nonatomic, assign) CGFloat p_top;         ///< Shortcut for frame.origin.y
@property (nonatomic, assign) CGFloat p_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic, assign) CGFloat p_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic, assign) CGFloat p_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic, assign) CGFloat p_width;       ///< Shortcut for frame.size.width.
@property (nonatomic, assign) CGFloat p_height;      ///< Shortcut for frame.size.height.
@property (nonatomic, assign) CGFloat p_centerX;     ///< Shortcut for center.x
@property (nonatomic, assign) CGFloat p_centerY;     ///< Shortcut for center.y

#pragma mark - Method

- (BOOL)p_containView:(UIView *)view;

@end
