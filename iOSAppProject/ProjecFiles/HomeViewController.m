//
//  HomeViewController.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/9/3.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "HomeViewController.h"
#import "NSObject+Category.h"
#import "UIViewController+Category.h"
#import "GCDWebServerDataResponse.h"
#import "UIView+FrameAnimation.h"
#import "FrameAnimationView.h"

@interface HomeViewController () <FrameAnimationViewDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"%d %d %d %d", kStatusBarHeight, kNavigationBarHeight, kTabBarHeight, kHomeIndicatorHeight);
    
}

- (void)frameAnimationView:(UIView *)frameAnimationView animationDidStart:(CAAnimation *)anim
{
    NSLog(@"函数名：%s，行号：%d", __FUNCTION__, __LINE__);
}

- (void)frameAnimationView:(UIView *)frameAnimationView animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"函数名：%s，行号：%d", __FUNCTION__, __LINE__);
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HomeViewController *vc = [[HomeViewController alloc] init];
    vc.aa = YES;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
