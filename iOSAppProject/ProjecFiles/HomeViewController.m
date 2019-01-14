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
#import "LoginManager.h"
#import "UITextField+Category.h"
#import "UITextField+Limit.h"

@interface HomeViewController () <UITextFieldDelegate>

@end

@implementation HomeViewController

- (void)dealloc {
    NSLog(@"函数名：%s，行号：%d", __FUNCTION__, __LINE__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        HomeViewController *vc = [[HomeViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupRightItem];
    
    UIViewController *vc = [[UIViewController alloc] init];
    [self addChildViewController:vc];
}

- (void)clickRightItem {
    NSLog(@"函数名：%s，行号：%d", __FUNCTION__, __LINE__);
}

- (void)setupRightItem {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItem)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
