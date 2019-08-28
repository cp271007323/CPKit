//
//  NSMutableAttributedString+Extension.m
//  yuexia
//
//  Created by 陈平 on 2017/12/5.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import "NSMutableAttributedString+Extension.h"
#import "Config.h"

@implementation NSMutableAttributedString (Extension)

+(NSMutableAttributedString *)attributedWithString:(NSString *)str
                                             color:(UIColor *)color
                                              font:(UIFont *)font{
    return [[NSMutableAttributedString alloc] initWithString:CPString(str) attributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font}];
    
}

+ (NSMutableAttributedString *)createAttributedImage:(UIImage *)image bounds:(CGRect)rect
{
    NSTextAttachment *attch = [NSTextAttachment new];
    attch.image = image;
    attch.bounds = rect;
    return [NSMutableAttributedString attributedStringWithAttachment:attch];
}

@end

