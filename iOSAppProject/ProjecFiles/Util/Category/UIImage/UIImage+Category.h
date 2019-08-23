//
//  UIImage+Category.h
//  iOSAppProject
//
//  Created by zhangpeng on 2019/1/7.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)


/**
 * 图片模糊处理
 *
 * @param percent  非法值按照0.5模糊处理 percent : 0.0 ~ 1.0
 *
 * @return UIImage
 */
- (UIImage *)fs_blurImageWithBlurPercent:(CGFloat)percent;

/**
 * 图片灰化处理
 *
 * @return UIImage
 */


/**
 * 获取一张 图片的缩略图
 *
 * @param thumbnailSize    缩略图size
 * @param borderSize       边框size
 * @param cornerRadius     圆角
 * @param contentMode      内容模式
 * @param quality          质量参数
 *
 * @return UIImage
 */
- (UIImage *)fs_thumbnailImage:(NSInteger)thumbnailSize transparentBorder:(NSUInteger)borderSize cornerRadius:(NSUInteger)cornerRadius resizeMode:(UIViewContentMode)contentMode interpolationQuality:(CGInterpolationQuality)quality;



@end

NS_ASSUME_NONNULL_END
