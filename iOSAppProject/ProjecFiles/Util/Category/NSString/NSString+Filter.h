//
//  NSString+Filter.h
//  iOSAppProject
//
//  Created by zhangpeng on 2019/1/7.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Filter)

+ (NSString *)filterCharactor:(NSString *)string withRegex:(NSString *)regexStr;

@end

NS_ASSUME_NONNULL_END
