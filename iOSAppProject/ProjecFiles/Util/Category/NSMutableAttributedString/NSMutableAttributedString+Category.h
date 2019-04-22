//
//  NSMutableAttributedString+Category.h
//  iOSAppProject
//
//  Created by zhangpeng on 2018/2/11.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LineStyle) {
    LineStyleDelete,
    LineStyleUnder
};

@interface NSMutableAttributedString (Category)

#pragma mark - AddAttributeStyle

- (void)fs_addLineWithStyle:(LineStyle)lineStyle range:(NSRange)range;

- (void)fs_addLineHeight:(CGFloat)lineHeight font:(UIFont *)font;

#pragma mark - AddAttributes

- (void)fs_addAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs range:(NSRange)range;

@end
