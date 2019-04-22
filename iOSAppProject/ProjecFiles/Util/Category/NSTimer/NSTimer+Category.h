//
//  NSTimer+Category.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/2/17.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Category)

+ (NSTimer *)fs_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     block:(void(^)(void))block
                                   repeats:(BOOL)repeats;

@end
