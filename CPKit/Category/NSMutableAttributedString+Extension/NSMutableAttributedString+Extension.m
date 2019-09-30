//
//  NSMutableAttributedString+Extension.m
//  chenp
//
//  Created by chenp on 2017/12/5.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import "NSMutableAttributedString+Extension.h"
#import "CPKit.h"

@implementation NSMutableAttributedString (Extension)

+(NSMutableAttributedString *)attributedWithString:(NSString *)str
                                             color:(UIColor *)color
                                              font:(UIFont *)font
{
    return [[NSMutableAttributedString alloc] initWithString:CPString(str) attributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font}];
    
}

@end

