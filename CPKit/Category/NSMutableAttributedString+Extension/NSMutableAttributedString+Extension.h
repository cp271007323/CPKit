//
//  NSMutableAttributedString+Extension.h
//  yuexia
//
//  Created by 陈平 on 2017/12/5.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CPAttributedImageLocation_left,
    CPAttributedImageLocation_right,
} CPAttributedImageLocation;


@interface NSMutableAttributedString (Extension)

/**
 富文本生成
 */
+(NSMutableAttributedString *)attributedWithString:(NSString *)str
                                             color:(UIColor *)color
                                              font:(UIFont *)font;

/**
 图片富文本
 */
+ (NSMutableAttributedString *)createAttributedImage:(UIImage *)image bounds:(CGRect)rect;

@end
