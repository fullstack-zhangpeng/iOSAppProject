//
//  Logger.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/23.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack.h>

typedef NS_ENUM(NSUInteger, P_LogLevel) {
    P_LogLevelDefault,
    MyEnumValueB,
    MyEnumValueC,
};

// 日志配置
@interface LoggerConfig : NSObject

/**
 是否输出在控制台
 */
@property (nonatomic, assign) BOOL logInConsole;

/**
 是否输出在系统控制台
 */
@property (nonatomic, assign) BOOL logInSystemConsole;

/**
 是否输出在文件
 */
@property (nonatomic, assign) BOOL logInFile;

/**
 log 文件路径
 */
@property (nonatomic, copy) NSString *logFilePath;

/**
 通用参数
 */
@property (nonatomic, strong) NSDictionary *commonParam;

@end

// 日志格式化
@interface LoggerFormatter : NSObject <DDLogFormatter>

@end

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

#pragma mark - 日志等级控制

@interface DDDynamicLogLevel : NSObject <DDRegisteredDynamicLogging>

@end
