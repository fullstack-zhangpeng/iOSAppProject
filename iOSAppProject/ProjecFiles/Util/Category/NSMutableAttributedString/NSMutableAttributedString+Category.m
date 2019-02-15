
//
//  NSMutableAttributedString+Category.m
//  P_App_OC
//
//  Created by zhangpeng on 2018/2/11.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "NSMutableAttributedString+Category.h"

@implementation NSMutableAttributedString (Category)

#pragma mark - AddAttributeStyle

- (void)p_addLineWithStyle:(LineStyle)lineStyle range:(NSRange)range {
    switch (lineStyle) {
        case LineStyleDelete: {
            [self p_addAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleNone)}
                                range: NSMakeRange(0, self.string.length)];
            [self p_addAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                                        NSBaselineOffsetAttributeName : @0}
                                range:range];
            break;
        }
        case LineStyleUnder: {
            [self p_addAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleNone)}
                                range: NSMakeRange(0, self.string.length)];
            [self p_addAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}
                                range:range];
            break;
        }
        default:
            break;
    }
}

- (void)p_addLineHeight:(CGFloat)lineHeight font:(UIFont *)font {
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.maximumLineHeight = lineHeight;
    paragraphStyle.minimumLineHeight = lineHeight;
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSParagraphStyleAttributeName] = paragraphStyle;
    CGFloat baselineOffset = (lineHeight - font.lineHeight) / 4;
    attributes[NSBaselineOffsetAttributeName] = @(baselineOffset);
    [self p_addAttributes:attributes range:NSMakeRange(0, self.length)];
}

#pragma mark - AddAttributes

- (void)p_addAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs range:(NSRange)range {
    if ([self isNilOrNullObject:attrs]) {
        return;
    }
    if ([self isCorrectRange:range forMutableAttributedString:self]) {
        [self addAttributes:attrs range:range];
    }
}

#pragma mark - Common

- (BOOL)isNilOrNullObject:(id)object {
    if (object == nil || [object isEqual: [NSNull null]]) {
        NSLog(@"function : %s has invalid argument : object can't be nil" , __FUNCTION__);
        return YES;
    }
    return NO;
}

- (BOOL)isCorrectRange:(NSRange)range forMutableAttributedString:(NSMutableAttributedString *)mutableAttributedString {
    if (range.location + range.length <= mutableAttributedString.string.length) {
        return YES;
    }
    return NO;
}

@end
