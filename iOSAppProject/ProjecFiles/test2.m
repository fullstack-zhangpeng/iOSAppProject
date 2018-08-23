//
//  test2.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/20.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "test2.h"
#import "test.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface test2 ()

@end

@implementation test2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fd_prefersNavigationBarHidden = YES;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 150, 100)];
    [button setTitle:@"2_click" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(c) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)c {
    test *t = [[test alloc] init];
    [self.navigationController pushViewController:t animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
