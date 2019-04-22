//
//  FrameAnimationView.m
//  iOSAppProject
//
//  Created by zhangpeng on 2019/4/18.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "FrameAnimationView.h"

static NSString * const FrameAnimation = @"FrameAnimation";

@interface FrameAnimationView () <CAAnimationDelegate>
@property (nonatomic, strong) CAKeyframeAnimation *animation;
@end

@implementation FrameAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _animationRepeatCount = 1;
        _animationDuration = 0.25;
        _animationRemovedOnCompletion = YES;
    }
    return self;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim {
    if (self.delegate && [self.delegate respondsToSelector:@selector(frameAnimationView:animationDidStart:)]) {
        [self.delegate frameAnimationView:self animationDidStart:anim];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.delegate && [self.delegate respondsToSelector:@selector(frameAnimationView:animationDidStop:finished:)]) {
        [self.delegate frameAnimationView:self animationDidStop:anim finished:flag];
    }
}

#pragma mark - Instance Methods

- (void)startAnimation {
    if (_animationImages.count <= 0) {
        return;
    }
    NSMutableArray *imageRefs = [NSMutableArray array];
    for (UIImage *image in _animationImages) {
        CGImageRef imageRef = image.CGImage;
        [imageRefs addObject:(__bridge id _Nonnull)(imageRef)];
    }
    self.animation.values = imageRefs;
    self.animation.duration = _animationDuration;
    self.animation.repeatCount = _animationRepeatCount;
    self.animation.removedOnCompletion = _animationRemovedOnCompletion;
    [self.layer addAnimation:self.animation forKey:FrameAnimation];
}

- (void)stopAnimation {
    [self.layer removeAnimationForKey:FrameAnimation];
}

#pragma mark - Getter & Setter

- (CAKeyframeAnimation *)animation {
    if (!_animation) {
        _animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
        _animation.delegate = self;
    }
    return _animation;
}

@end
