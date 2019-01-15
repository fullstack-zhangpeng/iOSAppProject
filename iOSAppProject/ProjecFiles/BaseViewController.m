//
//  BaseViewController.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/8/18.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItem;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (BOOL)prefersHomeIndicatorAutoHidden {
    return self.hideHomeIndicator;
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)getLeftBarButtonItem {
    return self.leftBarButtonItem;
}

- (UIBarButtonItem *)leftBarButtonItem {
    if (!_leftBarButtonItem) {
        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    }
    return _leftBarButtonItem;
}

@end
