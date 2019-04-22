//
//  FrameAnimationView.h
//  iOSAppProject
//
//  Created by zhangpeng on 2019/4/18.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FrameAnimationViewDelegate <NSObject>

- (void)frameAnimationView:(UIView *_Nonnull)frameAnimationView animationDidStart:(CAAnimation *_Nonnull)anim;

- (void)frameAnimationView:(UIView *_Nonnull)frameAnimationView animationDidStop:(CAAnimation *_Nonnull)anim finished:(BOOL)flag;

@end

NS_ASSUME_NONNULL_BEGIN

@interface FrameAnimationView : UIView
@property (nonatomic, copy) NSArray<UIImage *> *animationImages;

/**
 Animation repeatCount
 
 * Defaults to 1
 
 * If 0, then repeat animation an infinite number of times
 */
@property (nonatomic, assign) float animationRepeatCount;

/**
 Animation Duration
 
 * Defaults to 0.25
 */
@property (nonatomic, assign) CFTimeInterval animationDuration;

/**
 When true, the animation is removed from the render tree once its active duration has passed.
 
 * Defaults to YES.
 */
@property (nonatomic, assign) BOOL animationRemovedOnCompletion;

@property (nonatomic, weak) id<FrameAnimationViewDelegate> delegate;

- (void)startAnimation;
- (void)stopAnimation;
@end

NS_ASSUME_NONNULL_END
