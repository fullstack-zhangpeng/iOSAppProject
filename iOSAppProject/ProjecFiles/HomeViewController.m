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
#import "Util/Category/UIView/UIView+Category.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"%d %d %d %d", kStatusBarHeight, kNavigationBarHeight, kTabBarHeight, kHomeIndicatorHeight);

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HomeViewController *vc = [[HomeViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
