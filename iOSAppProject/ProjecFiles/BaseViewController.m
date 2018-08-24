//
//  BaseViewController.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/18.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "BaseViewController.h"
#import "Logger.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
