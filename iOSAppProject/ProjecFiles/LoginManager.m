//
//  LoginManager.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/10/17.
//  Copyright © 2018 zhangpeng. All rights reserved.
//

#import "LoginManager.h"
#import <WXApi.h>

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

@interface LoginManager () 

@end

@implementation LoginManager

Singleton();

- (void)loginWithType:(LoginType)loginType {
    switch (loginType) {
        case LoginType_QQ:
            [self loginWithQQ];
            break;
        case LoginType_WX:
            [self loginWithWX];
            break;
        default:
            break;
    }
}

- (void)loginWithQQ {
    
}

- (BOOL)isInstalledWX {
    return [WXApi isWXAppInstalled];
}

- (void)loginWithWX {
    
}

@end


