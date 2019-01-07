//
//  SettingViewController.m
//  iOSAppProject
//
//  Created by zhangpeng on 2018/9/3.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "SettingViewController.h"
#import <FLEXManager.h>
#import "NSObject+Category.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray <NSArray *> *settingArray;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:nd_Setting_FLEXDebug];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.settingArray = @[
                          @[
                              @"FLEX Debug"
                              ]
                          ];
    [self setupUI];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.settingArray[indexPath.section][indexPath.row];
    if ([title containsString:@"FLEX Debug"]) {
        BOOL switchStatus = [[NSUserDefaults standardUserDefaults] boolForKey:nd_Setting_FLEXDebug];
        [[NSUserDefaults standardUserDefaults] setBool:!switchStatus forKey:nd_Setting_FLEXDebug];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        if (!switchStatus) {
            [[FLEXManager sharedManager] showExplorer];
        } else {
            [[FLEXManager sharedManager] hideExplorer];
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSString *title = self.settingArray[indexPath.section][indexPath.row];
    cell.textLabel.text = title;
    if ([title containsString:@"FLEX Debug"]) {
        BOOL switchStatus = [[NSUserDefaults standardUserDefaults] boolForKey:nd_Setting_FLEXDebug];
        cell.detailTextLabel.text = switchStatus ? @"打开" : @"关闭";
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.settingArray[section].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.settingArray.count;
}

#pragma mark - UI

- (void)setupUI {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.p_width, self.view.p_height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.p_width, CGFLOAT_MIN)];
    tableView.tableHeaderView = header;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
