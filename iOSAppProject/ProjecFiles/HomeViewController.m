//
//  HomeViewController.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/9/3.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "HomeViewController.h"
#import "GCDWebServer.h"
#import "GCDWebServerDataResponse.h"
#import "LoginManager.h"

@interface HomeViewController ()
@property (nonatomic, strong) GCDWebServer *webServer;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LoginManager *m1 = [LoginManager sharedInstance];
    LoginManager *m2 = [[LoginManager alloc] init];
    LoginManager *m3 = [m1 copy];
    LoginManager *m4 = [m1 mutableCopy];
//    LoginManager *m5 = class_createInstance([LoginManager class], 0);
   
//    NSLog(@"%s %@", __func__, @[m1, m2]);
    
    NSLog(@"%s %@", __func__, @[m1,m2,m3,m4]);
    
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
