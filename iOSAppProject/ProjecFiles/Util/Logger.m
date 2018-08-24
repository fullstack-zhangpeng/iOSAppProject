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

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif

@interface Logger ()

@end

@implementation Logger

+ (void)setupLogger {
    [DDTTYLogger sharedInstance].logFormatter = [[LoggerFormatter alloc] init];
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    //    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
    //    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    //    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    //    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    //
    //    [DDLog addLogger:fileLogger];
}

@end

#pragma mark - Logger Formatter

@interface LoggerFormatter ()

@end

@implementation LoggerFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSLog(@"%@", logMessage);
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
    switch (logMessage->_flag) {
        case DDLogFlagError    : logLevel = @"E"; break;
        case DDLogFlagWarning  : logLevel = @"W"; break;
        case DDLogFlagInfo     : logLevel = @"I"; break;
        case DDLogFlagDebug    : logLevel = @"D"; break;
        default                : logLevel = @"V"; break;
    }
    NSDateFormatter *f = [NSDateFormatter p_dateFormatterWithString:df_yyy_MM_dd_HH_mm_ss];
    NSLog(@"f: %p", f);
    NSString *message = [NSString stringWithFormat:@"-LogStart- \n logInfo: [%s], logLevel: %@, function: %@, line: %@ \n logMessage: %@\n-LogEnd-", [[f stringFromDate:[NSDate date]] UTF8String],logLevel, logMessage.function, @(logMessage.line), logMessage.message];
    return message;
}

@end
