//
//  BaseTabBar.m
//  iOSAppProject
//
//  Created by zhangpeng on 2019/3/17.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "BaseTabBar.h"

@interface BaseTabBar ()
{
    UIEdgeInsets _oldSafeAreaInsets;
}
@end

@implementation BaseTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _oldSafeAreaInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _oldSafeAreaInsets = UIEdgeInsetsZero;
}

- (void)safeAreaInsetsDidChange {
    [super safeAreaInsetsDidChange];
    if (!UIEdgeInsetsEqualToEdgeInsets(_oldSafeAreaInsets, self.safeAreaInsets)) {
        [self invalidateIntrinsicContentSize];
        if (self.superview) {
            [self.superview setNeedsLayout];
            [self.superview layoutSubviews];
        }
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    size = [super sizeThatFits:size];
    if (@available(iOS 11.0, *)) {
        float bottomInset = self.safeAreaInsets.bottom;
        if (bottomInset > 0 && size.height < 50 && (size.height + bottomInset < 90)) {
            size.height += bottomInset;
        }
    }
    return size;
}

- (void)setFrame:(CGRect)frame {
    if (self.superview) {
        if (frame.origin.y + frame.size.height != self.superview.frame.size.height) {
            frame.origin.y = self.superview.frame.size.height - frame.size.height;
        }
    }
    [super setFrame:frame];
}

// iOS 11 iPad 图片与标题横向排列，放开下面注释掉的代码即可解决
//- (UITraitCollection *)traitCollection {
//    return [UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassCompact];
//}
@end
