//
//  UIDevice+Category.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/1/28.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Category)

/// Whether the device is a simulator.
@property(nonatomic, readonly) BOOL isSimulator;

/// Whether the device is iPad/iPad mini.
@property(nonatomic, readonly) BOOL isIPad;
/// Whether the device is iPhone.
@property(nonatomic, readonly) BOOL isIPhone;

/// Whether the device is fullScreenSeries.
@property(nonatomic, readonly) BOOL isFullScreenSeries;

/**
 设备型号
 * e.g. @"iPhone X"
 */
@property(nonatomic, readonly) NSString *deviceModel;

/**
 设备型号
 * e.g. @"11.0"
 */
@property(nonatomic, readonly) NSString *deviceVersion;

/**
 设备分辨率
 * e.g. @"1125 x 2436"
 */
@property(nonatomic, readonly) NSString *deviceResolution;

/**
 运营商
 */
@property(nonatomic, readonly) NSString *deviceCarrier;

/**
 UUID
 */
@property(nonatomic, readonly) NSString *deviceUUID;

@end
