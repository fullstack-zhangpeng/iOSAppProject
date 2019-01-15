//
//  ViewController.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/18.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 * 隐藏 HomeIndicator
 *
 * push 前设置
 */
@property (nonatomic, assign) BOOL hideHomeIndicator;

/**
 * 隐藏 左侧 leftBarButtonItem
 *
 * push 前设置
 */
@property (nonatomic, assign) BOOL hideLeftBarButtonItem;

/**
 左侧 leftBarButtonItem

 @return 默认是“返回”
 */
- (UIBarButtonItem *)getLeftBarButtonItem;

@end

