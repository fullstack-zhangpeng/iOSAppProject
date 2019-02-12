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
#import "Util/Category/UIDevice/UIDevice+Category.h"

@interface HomeViewController () <UITextFieldDelegate>

@end

@implementation HomeViewController

- (void)dealloc {
    NSLog(@"函数名：%s，行号：%d", __FUNCTION__, __LINE__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%d %d %d %d", kStatusBarHeight, kNavigationBarHeight, kTabBarHeight, kHomeIndicatorHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
