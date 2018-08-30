//
//  Logger.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/23.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack.h>

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif

// 日志配置
@interface LoggerConfig : NSObject

@end

// 日志格式化
@interface LoggerFormatter : NSObject <DDLogFormatter>

@end

@interface Logger : NSObject

+ (instancetype)sharedInstance;

+ (void)setupLogger:(void(^)(LoggerConfig *config))block;

@end


