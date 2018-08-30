//
//  Logger.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/23.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "Logger.h"
#import "NSDateFormatter+Category.h"

@class LoggerFormatter;

#pragma mark - 设置输出等级


@interface LoggerConfig ()

@end

@implementation LoggerConfig

@end

@interface Logger ()

@end

@implementation Logger

+ (instancetype)sharedInstance {
    static Logger *instance = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[Logger alloc] init];
    }) ;
    return instance ;
}

+ (void)setupLogger:(void (^)(LoggerConfig *))block {
    
}

#pragma mark ---

- (void)setupConfig:(void(^)(LoggerConfig *config))block {
    LoggerConfig *config = [[LoggerConfig alloc] init];
//    config.consoleLog = NO;
//    XM_SAFE_BLOCK(block, config);
    
    if (block) {
        block(config);
    }
    
//    if (config.generalServer) {
//        self.generalServer = config.generalServer;
//    }
//    if (config.generalParameters.count > 0) {
//        [self.generalParameters addEntriesFromDictionary:config.generalParameters];
//    }
//    if (config.generalHeaders.count > 0) {
//        [self.generalHeaders addEntriesFromDictionary:config.generalHeaders];
//    }
//    if (config.callbackQueue != NULL) {
//        self.callbackQueue = config.callbackQueue;
//    }
//    if (config.generalUserInfo) {
//        self.generalUserInfo = config.generalUserInfo;
//    }
//    if (config.engine) {
//        self.engine = config.engine;
//    }
//    self.consoleLog = config.consoleLog;
}

+ (void)setupLogger {
    [DDTTYLogger sharedInstance].logFormatter = [[LoggerFormatter alloc] init];
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    // [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
    // DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    // fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    // fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    //
    // [DDLog addLogger:fileLogger];
}

@end

#pragma mark - Logger Formatter

@interface LoggerFormatter ()

@end

@implementation LoggerFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    //    NSString *_message;
    //    DDLogLevel _level;
    //    DDLogFlag _flag;
    //    NSInteger _context;
    //    NSString *_file;
    //    NSString *_fileName;
    //    NSString *_function;
    //    NSUInteger _line;
    //    id _tag;
    //    DDLogMessageOptions _options;
    //    NSDate *_timestamp;
    //    NSString *_threadID;
    //    NSString *_threadName;
    //    NSString *_queueLabel;
    NSString *logLevel;
    switch (logMessage.flag) {
        case DDLogFlagError    : logLevel = @"Error"; break;
        case DDLogFlagWarning  : logLevel = @"Warning"; break;
        case DDLogFlagInfo     : logLevel = @"Info"; break;
        case DDLogFlagDebug    : logLevel = @"Debug"; break;
        default                : logLevel = @"Verbose"; break;
    }
    NSDateFormatter *f = [NSDateFormatter p_dateFormatterWithString:df_yyy_MM_dd_HH_mm_ss];
    NSLog(@"f: %p", f);
    NSString *message = [NSString stringWithFormat:@"-LogStart- \n time: [%s]\n logInfo: logLevel: %@, function: %@, line: %@ \n logMessage: %@\n-LogEnd-", [[f stringFromDate:[NSDate date]] UTF8String], logLevel, logMessage.function, @(logMessage.line), logMessage.message];
    return message;
}

@end
