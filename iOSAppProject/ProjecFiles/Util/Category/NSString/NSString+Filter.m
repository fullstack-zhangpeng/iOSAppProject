//
//  NSString+Filter.m
//  iOSAppProject
//
//  Created by zhangpeng on 2019/1/7.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "NSString+Filter.h"

@implementation NSString (Filter)

/**
 根据正则表达式过滤文字
 
 @param string 需要校验的文字
 @param regexStr 用以校验的正则表达式
 @return 过滤后的文字
 */
+ (NSString *)filterCharactor:(NSString *)string withRegex:(NSString *)regexStr {
    NSString *searchText = string;
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *result = [regex stringByReplacingMatchesInString:searchText options:NSMatchingReportCompletion range:NSMakeRange(0, searchText.length) withTemplate:@""];
    return result;
}

@end
