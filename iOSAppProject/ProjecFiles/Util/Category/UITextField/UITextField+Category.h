//
//  UITextField+Category.h
//  iOSAppProject
//
//  Created by zhangpeng on 2019/1/8.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef BOOL (^FS_InputBlock) (NSString *inputCharacter);
typedef void (^FS_InputFailedBlock) (void);

@interface UITextField (Category)

#pragma mark - Limit

- (void)limitWithMaxLength:(NSInteger)maxLength inputFailedBlock:(FS_InputFailedBlock)inputFailedBlock;

- (void)limitWithMaxLength:(NSInteger)maxLength inputBlock:(FS_InputBlock)inputBlock inputFailedBlock:(FS_InputFailedBlock)inputFailedBlock;

#pragma mark - Private

- (NSString *)fs_primaryLanguage;

- (void)setPlaceholder:(NSString *)placeholder color:(UIColor *)color font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
