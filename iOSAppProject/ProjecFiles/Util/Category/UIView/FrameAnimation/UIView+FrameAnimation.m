//
//  UIView+FrameAnimation.m
//  iOSAppProject
//
//  Created by zhangpeng on 2019/4/18.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UIView+FrameAnimation.h"

@implementation UIView (FrameAnimation)

- (void)addFrameAnimationWithImages:(NSArray<UIImage *> *)images block:(AnimationBlock)block
{
    NSMutableArray *imageRefs = [NSMutableArray array];
    for (UIImage *image in images) {
        CGImageRef imageRef = image.CGImage;
        [imageRefs addObject:(__bridge id _Nonnull)(imageRef)];
    }
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    if (block) {
        block(animation);
    }
    animation.values = imageRefs.copy;
    [self.layer addAnimation:animation forKey:nil];
    [self.layer removeAllAnimations];
}

@end
