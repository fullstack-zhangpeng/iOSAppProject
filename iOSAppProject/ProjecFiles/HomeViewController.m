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

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%d %d %d %d", kStatusBarHeight, kNavigationBarHeight, kTabBarHeight, kHomeIndicatorHeight);
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:sc];
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sc.frame.size.width, 60)];
    subView.backgroundColor = [UIColor redColor];
    [sc addSubview:subView];
    if (@available(iOS 11.0, *)) {
        NSLog(@"%@", NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
        NSLog(@"---");
        NSLog(@"%@", NSStringFromUIEdgeInsets(sc.contentInset));
        NSLog(@"%@", NSStringFromUIEdgeInsets(sc.safeAreaInsets));
        NSLog(@"%@", NSStringFromUIEdgeInsets(sc.adjustedContentInset));
    } else {
        // Fallback on earlier versions
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    HomeViewController *vc = [[HomeViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
