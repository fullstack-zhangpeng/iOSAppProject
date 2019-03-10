//
//  NSString+URL.h
//  iOSAppProject
//
//  Created by zhangpeng on 2019/3/10.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URL)

// 添加参数
- (NSString *)appendParamWithKey:(NSString *)key value:(NSString *)value;

// 添加参数
- (NSString *)appendParams:(NSDictionary *)dic;

/**
 *  获取URL中的参数
 *
 *  @return NSDictionary parameters
 */
- (NSDictionary *)getURLParameters;

@end

NS_ASSUME_NONNULL_END
