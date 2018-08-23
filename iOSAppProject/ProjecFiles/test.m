//
//  test.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/20.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "test.h"
#import "test2.h"

@interface test ()

@end

@implementation test

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 150, 100)];
    [button setTitle:@"click" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(c) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)c {
    test2 *t = [[test2 alloc] init];
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
