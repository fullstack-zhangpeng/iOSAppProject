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

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Private Method

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Instance Method

- (UIBarButtonItem *)getLeftBarButtonItem {
    return self.leftBarButtonItem;
}

#pragma mark - System Method

- (BOOL)prefersHomeIndicatorAutoHidden {
    return self.hideHomeIndicator;
}

#pragma mark - Lazy Load

- (UIBarButtonItem *)leftBarButtonItem {
    if (!_leftBarButtonItem) {
        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    }
    return _leftBarButtonItem;
}

@end
