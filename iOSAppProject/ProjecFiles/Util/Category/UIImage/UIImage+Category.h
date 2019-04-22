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
 * 将一张图片绘制到另一张图片的指定位置
 *
 * @param image         图片
 * @param point         指定绘制位置
 *
 * @return UIImage
 */
- (UIImage *)fs_drawImage:(UIImage *)image atPosition:(CGPoint)point;

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
- (UIImage *)fs_greyImage;

/**
 * 圆角图片创建
 *
 * @param size  大小
 * @param color 颜色
 * @param radius  圆角
 *
 * @return UIImage
 */
+ (UIImage *)fs_roundedImageWithSize:(CGSize)size color:(UIColor *)color radius:(CGFloat)radius;

/**
 * 圆角处理
 *
 * @return UIImage
 */
- (UIImage *)fs_roundedImage;

/**
 * 圆角处理
 *
 * @param radius 指定圆角弧度
 *
 * @return UIImage
 */
- (UIImage *)fs_roundedImageWithRadius:(NSInteger)radius;

/**
 * 圆角处理
 *
 * @param cornerRadius    指定圆角弧度
 * @param rectCornerType  指定圆角位置
 *
 * @return UIImage
 */
- (UIImage *)fs_roundedImageWithCornerRadius:(CGFloat)cornerRadius cornerType:(UIRectCorner)rectCornerType;

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

/**
 * 图片裁剪
 *
 * @param croppedSize      裁剪size
 * @param contentMode      内容模式
 * @param quality          质量参数
 *
 * @return UIImage
 */
- (UIImage *)fs_cropImageWithCroppedSize:(CGSize)croppedSize contentMode:(UIViewContentMode)contentMode interpolationQuality:(CGInterpolationQuality)quality;

/**
 * 将一张图片调整到指定size，生成一张新图片
 *
 * @param size      size
 *
 * @return UIImage
 */
- (UIImage *)fs_resizedImageToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
