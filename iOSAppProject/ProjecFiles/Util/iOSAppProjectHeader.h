//
//  iOSAppProjectHeader.h
//  iOSAppProject
//
//  Created by zhangpeng on 2019/1/15.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#ifndef iOSAppProjectHeader_h
#define iOSAppProjectHeader_h

// 定义不同的模式下的输出函数
#ifdef DEBUG

#define NSLog(...) NSLog(__VA_ARGS__)
#define DebugLog(fmt, ...) NSLog((@"\n[文件名:%s]\n""[函数名:%s]\n""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#else

#define NSLog(...)
#define DebugLog(...);

#endif

// Frame
#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#endif /* iOSAppProjectHeader_h */
