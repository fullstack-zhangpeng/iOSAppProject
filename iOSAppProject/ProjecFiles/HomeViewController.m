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
#import "UITextField+Category.h"
#import "UITextField+Limit.h"

@interface HomeViewController () <UITextFieldDelegate>
@property (nonatomic, strong) GCDWebServer *webServer;
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
    // Do any additional setup after loading the view.
    
    //    LoginManager *m1 = [LoginManager sharedInstance];
    //    LoginManager *m2 = [[LoginManager alloc] init];
    //    LoginManager *m3 = [m1 copy];
    //    LoginManager *m4 = [m1 mutableCopy];
    //    LoginManager *m5 = class_createInstance([LoginManager class], 0);
    
    //    NSLog(@"%s %@", __func__, @[m1, m2]);
    
    //    NSLog(@"%s %@", __func__, @[m1,m2,m3,m4]);
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, self.view.p_width - 20 * 2, 44)];
    tf.delegate = self;
    tf.borderStyle = UITextBorderStyleRoundedRect;
    
    [tf limitWithMaxLength:3 inputFailedBlock:^{
        NSLog(@"---");
    }];
    
//    [tf limitWithMaxLength:3
//                inputBlock:^BOOL(NSString * _Nonnull inputCharacter) {
//                    NSLog(@"inputCharacter: %@", inputCharacter);
//                    return YES;
//                }
//          inputFailedBlock:^{
//              NSLog(@"sss");
//          }];
    [self.view addSubview:tf];
    
    
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
