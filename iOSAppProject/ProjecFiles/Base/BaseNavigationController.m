//
//  NavigationController.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/20.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "BaseNavigationController.h"
#import "BaseViewController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        if ([viewController isKindOfClass:[BaseViewController class]]) {
            BaseViewController *vc = (BaseViewController *)viewController;
            if (vc.hideLeftBarButtonItem) {
                vc.navigationItem.hidesBackButton = YES;
            }
            else {
                vc.navigationItem.leftBarButtonItem = [vc getLeftBarButtonItem];
            }
        }
        else {
            // 如果不是 BaseViewController，由业务自行处理
        }
    }
    [super pushViewController:viewController animated:animated];
    // 修改tabBar的frame
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}

@end
