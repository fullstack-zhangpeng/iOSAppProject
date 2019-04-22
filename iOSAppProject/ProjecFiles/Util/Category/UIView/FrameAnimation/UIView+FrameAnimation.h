//
//  UIView+FrameAnimation.h
//  iOSAppProject
//
//  Created by zhangpeng on 2019/4/18.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AnimationBlock)(CAKeyframeAnimation * _Nonnull animation);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FrameAnimation)
- (void)addFrameAnimationWithImages:(NSArray<UIImage *> *)images block:(AnimationBlock)block;
@end

NS_ASSUME_NONNULL_END
