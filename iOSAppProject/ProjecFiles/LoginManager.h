//
//  LoginManager.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/10/17.
//  Copyright © 2018 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LoginType) {
    LoginType_QQ,
    LoginType_WX
};

@interface LoginManager : NSObject
+ (instancetype)sharedInstance;
- (BOOL)isInstalledWX;
- (BOOL)isInstalledQQ;
- (void)loginWithType:(LoginType)loginType;
@end

NS_ASSUME_NONNULL_END
