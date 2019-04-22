//
//  RuntimeKit.h
//  RuntimeDemo
//
//  Created by zhangpeng on 2017/4/9.
//  Copyright © 2017年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
#import <objc/message.h>

@interface RuntimeKit : NSObject

/**
 获取类名

 @param class 相应类
 @return NSString：类名
 */
+ (NSString *)fetchClassName:(Class)class;

/**
 获取成员变量

 @param class 成员变量所在的类
 @return 返回成员变量字符串数组
 */
+ (NSArray *)fetchIvarList:(Class)class;

/**
 获取类的属性列表, 包括私有和公有属性，即定义在延展中的属性

 @param class Class
 @return 属性列表数组
 */
+ (NSArray *)fetchPropertyList:(Class)class;

/**
 获取对象方法列表：getter, setter, 对象方法等。但不能获取类方法

 @param class 方法所在的类
 @return 该类的方法列表
 */
+ (NSArray *)fetchMethodList:(Class)class;

/**
 获取协议列表

 @param class 实现协议的类
 @return 返回该类实现的协议列表
 */
+ (NSArray *)fetchProtocolList:(Class)class;

/**
 添加新的方法

 @param class 被添加方法的类
 @param methodSel SEL
 @param methodSelImpl 提供IMP的SEL
 */
+ (void)addMethod:(Class)class methodSel:(SEL)methodSel methodSelImpl:(SEL)methodSelImpl;

/**
 SwapMethSod

 @param class Class
 @param originalMethod originalMethod
 @param swizzledMethod swizzledMethod
 */
+ (void)swapMethod:(Class)class originalMethod:(SEL)originalMethod swizzledMethod:(SEL)swizzledMethod;

@end
