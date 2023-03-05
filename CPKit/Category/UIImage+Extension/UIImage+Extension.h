//
//  UIImage+Extension.h
//  Mac
//
//  Created by Mac on 2019/7/31.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

/** 绘制颜色图片 */
- (UIImage *)imageWithColor:(UIColor *)color;

/** 绘制颜色图片 */
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
