//
//  Logger.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/23.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack.h>

typedef NS_ENUM(NSUInteger, P_LogType) {
    P_LogTypeInfo
};

#pragma mark - LoggerLevel

@interface LoggerLevel : NSObject <DDRegisteredDynamicLogging>

@end

#pragma mark - LoggerConfig
@interface LoggerConfig : NSObject

/**
 log 文件路径
 */
@property (nonatomic, copy) NSString *logFilePath;

/**
 通用参数
 */
@property (nonatomic, strong) NSDictionary *commonParam;

@end

#pragma mark - LoggerFormatter

@interface LoggerFormatter : NSObject <DDLogFormatter>

@end

#pragma mark - Logger

@interface Logger : NSObject

+ (instancetype)sharedInstance;

- (void)setupLogger:(void(^)(LoggerConfig *config))block;

/**
 打点

 @param logName 打点名字
 @param param 打点参数
 */
- (void)logWithName:(NSString *)logName
              param:(NSDictionary *)param;

@end
