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
#import "TViewController.h"
@interface HomeViewController () <UITextFieldDelegate>

@end

@implementation HomeViewController

- (void)dealloc {
    NSLog(@"函数名：%s，行号：%d", __FUNCTION__, __LINE__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TViewController *vc = [[TViewController alloc] init];
//    vc.hideLeftBarButtonItem = YES;
    vc.hideHomeIndicator = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupRightItem];
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
