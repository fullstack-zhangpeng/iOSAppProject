//
//  AppDelegate+Initialization.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/20.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "AppDelegate+Initialization.h"
#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "Logger.h"

@implementation AppDelegate (Initialization)

- (void)setupRootViewController {
    // Setup Window
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [UITabBar appearance];
    
    // Setup ChildVC
    BaseNavigationController *nav0 = [self setupTabBarControllerChildVCWithVC:[[BaseViewController alloc] init] title:@"t" image:nil selectedImage:nil];
    BaseNavigationController *nav1 = [self setupTabBarControllerChildVCWithVC:[[BaseViewController alloc] init] title:@"t" image:nil selectedImage:nil];
    BaseNavigationController *nav2 = [self setupTabBarControllerChildVCWithVC:[[BaseViewController alloc] init] title:@"t" image:nil selectedImage:nil];
    
    // Setup RootViewController
    BaseTabBarController *tabBarController = [[BaseTabBarController alloc] init];
    tabBarController.viewControllers = @[nav0, nav1, nav2];
    self.window.rootViewController = tabBarController;
}

- (BaseNavigationController *)setupTabBarControllerChildVCWithVC:(BaseViewController *)vc
                                                           title:(NSString *)title
                                                           image:(UIImage *)image
                                                   selectedImage:(UIImage *)selectedImage {
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    return nav;
}

- (void)setupLogger{
    [[Logger sharedInstance] setupLogger:^(LoggerConfig *config) {
        
        
    }];
    
    [[Logger sharedInstance] logWithName:@"Name" param:@{@"key": @"value"}];
}

@end
