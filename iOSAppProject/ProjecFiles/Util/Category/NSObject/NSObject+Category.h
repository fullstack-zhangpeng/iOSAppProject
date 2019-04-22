//
//  NSObject+Category.h
//  iOSAppProject
//
//  Created by zhangpeng on 2019/1/7.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#define Singleton() \
static id _instance = nil; \
+ (instancetype)sharedInstance { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[[self class] alloc] init]; \
}); \
return _instance; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t token; \
dispatch_once(&token, ^{ \
if(_instance == nil) { \
_instance = [super allocWithZone:zone]; \
} \
}); \
return _instance; \
} \
- (nonnull id)copyWithZone:(nullable NSZone *)zone { \
return [[self class] sharedInstance]; \
} \
- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone { \
return [[self class] sharedInstance]; \
}

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Category)

- (NSString *)fs_description;

/**
 * 根据指定可以获取对象关联的一个属性
 *
 * @param key 关联对象的key
 *
 * @return key对应的关联对象
 */
- (id)fs_objectWithAssociatedKey:(void *)key;

/**
 * 给一个对象按照指定策略关联一个对象
 *
 * @param object 待关联对象
 * @param key 关联对象指定的key
 * @param policy 关联策略
 *
 */
- (void)fs_setObject:(id)object forAssociatedKey:(void *)key associationPolicy:(objc_AssociationPolicy)policy;

@end

NS_ASSUME_NONNULL_END
