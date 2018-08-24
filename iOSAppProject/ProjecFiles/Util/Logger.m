//
//  Logger.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/23.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "Logger.h"

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif

@implementation Logger

+ (void)setupLogger {
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    //    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    
//    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
//    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
//    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//
//    [DDLog addLogger:fileLogger];
    
    DDLogError(@"Paper Jam!");       // E | Paper Jam!
    DDLogWarn(@"Low toner.");        // W | Low toner.
    DDLogInfo(@"Doc printed.");      // I | Doc printed.
    DDLogDebug(@"Debugging");        // D | Debugging
    DDLogVerbose(@"Init doc_parse"); // V | Init doc_parse.
}
@end
