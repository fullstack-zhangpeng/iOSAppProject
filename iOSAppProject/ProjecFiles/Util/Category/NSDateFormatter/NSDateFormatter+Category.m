//
//  NSDateFormatter+Category.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/20.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "NSDateFormatter+Category.h"

#pragma mark - Date Formatter

NSString *const df_yyyy = @"yyyy";
NSString *const df_MM = @"MM";
NSString *const df_yyyyMM = @"yyyyMM";
NSString *const df_yyyy_MM = @"yyyy-MM";
NSString *const df_yyyyMMdd = @"yyyyMMdd";
NSString *const df_yyyy_MM_dd = @"yyyy-MM-dd";
NSString *const df_yyyMMddHHmmss = @"yyyyMMddHHmmss";
NSString *const df_yyy_MM_dd_HH_mm_ss = @"yyyy-MM-dd HH:mm:ss";

@implementation NSDateFormatter (Category)

+ (NSDateFormatter *)fs_dateFormatterWithString:(NSString *)format {
    // 版本2 ，使用当前线程字典来保存对象
    NSMutableDictionary *threadDic = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateFormatter = [threadDic objectForKey:format];
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:format];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        [dateFormatter setLocale:[NSLocale systemLocale]];
        [threadDic setObject:dateFormatter forKey:format];
    }
    return dateFormatter;
    /*
     版本1.
     static dispatch_once_t onceToken;
     static NSMutableDictionary *formatterDic;
     dispatch_once(&onceToken, ^{
     formatterDic = [NSMutableDictionary dictionaryWithCapacity:8];
     });
     
     NSDateFormatter *dateFormatter_ = [formatterDic objectForKey:format];
     if (dateFormatter_ == nil) {
     @synchronized(formatterDic){
     dateFormatter_ = [NSDateFormatter new];
     dateFormatter_.dateFormat = format;
     [formatterDic setObject:dateFormatter_ forKey:format];
     
     //可能需要设置一些默认属性，防止用户默认的设置造成时间转换问题，这个后续再看
     //            [dateFormatter_ setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]];
     //            [dateFormatter_ setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
     //            [dateFormatter_ setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
     }
     
     }
     
     return dateFormatter_;
     */
}

@end
