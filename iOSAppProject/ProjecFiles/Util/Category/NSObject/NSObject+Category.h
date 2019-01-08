//
//  NSObject+Category.h
//  iOSAppProject
//
//  Created by zhangpeng on 2019/1/7.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Category)

- (NSString *)p_description;

/**
 * 根据指定可以获取对象关联的一个属性
 *
 * @param key 关联对象的key
 *
 * @return key对应的关联对象
 */
- (id)p_objectWithAssociatedKey:(void *)key;

/**
 * 给一个对象按照指定策略关联一个对象
 *
 * @param object 待关联对象
 * @param key 关联对象指定的key
 * @param policy 关联策略
 *
 */
- (void)p_setObject:(id)object forAssociatedKey:(void *)key associationPolicy:(objc_AssociationPolicy)policy;

@end

NS_ASSUME_NONNULL_END
