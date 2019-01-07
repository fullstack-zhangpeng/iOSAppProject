
//
//  NSMutableAttributedString+Category.m
//  P_App_OC
//
//  Created by zhangpeng on 2018/2/11.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "NSMutableAttributedString+Category.h"

@implementation NSMutableAttributedString (Category)

- (void)addLineWithStyle:(LineStyle)lineStyle range:(NSRange)range {
    switch (lineStyle) {
        case LineStyleDelete: {
            [self safelyAddAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleNone)}
                                range: NSMakeRange(0, self.string.length)];
            [self safelyAddAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
                                        NSBaselineOffsetAttributeName : @0}
                                range:range];
            break;
        }
        case LineStyleUnder: {
            [self safelyAddAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleNone)}
                                range: NSMakeRange(0, self.string.length)];
            [self safelyAddAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}
                                range:range];
            break;
        }
        default:
            break;
    }
}

- (void)safelyAddAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs range:(NSRange)range
{
    if ([self isNilOrNullObject:attrs]) {
        return;
    }
    if ([self isCorrectRange:range forMutableAttributedString:self]) {
        [self addAttributes:attrs range:range];
    }
}

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
