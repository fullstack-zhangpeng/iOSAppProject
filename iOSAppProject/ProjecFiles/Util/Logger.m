//
//  Logger.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/23.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "Logger.h"
#import "NSDateFormatter+Category.h"

#ifdef DEBUG
static DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif

@class LoggerFormatter;

#pragma mark - 设置输出等级


@interface LoggerConfig ()

@end

@implementation LoggerConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.logInConsole = YES;
        self.logInFile = NO;
    }
    return self;
}

@end

@interface Logger ()
@property (nonatomic, strong) LoggerConfig *config;
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

#pragma mark ---

- (void)logWithName:(NSString *)logName param:(NSDictionary *)param {
    NSLog(@"logName: %@", logName);
    NSLog(@"param: %@", param);
    
    NSLog(@"config: %@", self.config);
    DDLogInfo(@"111");
}

#pragma mark ---

- (void)setupLogger:(void (^)(LoggerConfig *))block {
    LoggerConfig *config = [[LoggerConfig alloc] init];
    if (block) {
        block(config);
    }
    
    if (config.logInConsole) {
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
    }
    
    if (config.logInSystemConsole) {
        [DDLog addLogger:[DDASLLogger sharedInstance]];
    }
    
    if (config.logInFile) {
        DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
        
        [DDLog addLogger:fileLogger];
    }
    self.config = config;
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

@implementation DDDynamicLogLevel

+ (DDLogLevel)ddLogLevel {
    return ddLogLevel;
}

+ (void)ddSetLogLevel:(DDLogLevel)ddLogLevel {
    ddLogLevel = ddLogLevel;
}

@end

