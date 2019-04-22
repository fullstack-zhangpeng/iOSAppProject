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

@property (nonatomic, assign) CGPoint fs_origin;      ///< Shortcut for frame.origin.
@property (nonatomic, assign) CGSize fs_size;         ///< Shortcut for frame.size.
@property (nonatomic, assign) CGFloat fs_top;         ///< Shortcut for frame.origin.y
@property (nonatomic, assign) CGFloat fs_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic, assign) CGFloat fs_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic, assign) CGFloat fs_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic, assign) CGFloat fs_width;       ///< Shortcut for frame.size.width.
@property (nonatomic, assign) CGFloat fs_height;      ///< Shortcut for frame.size.height.
@property (nonatomic, assign) CGFloat fs_centerX;     ///< Shortcut for center.x
@property (nonatomic, assign) CGFloat fs_centerY;     ///< Shortcut for center.y

#pragma mark - Method

- (BOOL)fs_containView:(UIView *)view;

@end
