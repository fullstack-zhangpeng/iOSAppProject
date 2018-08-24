//
//  Logger.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/23.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack.h>

@interface Logger : NSObject

+ (void)setupLogger;

@end

@interface LoggerFormatter : NSObject <DDLogFormatter>

@end
