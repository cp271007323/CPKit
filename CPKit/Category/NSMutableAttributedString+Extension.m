//
//  NSMutableAttributedString+Extension.m
//  RouXiAntique_Shop
//
//  Created by RouXiAntique_Shop on 2017/12/5.
//  Copyright © 2017年 RouXiAntique_Shop. All rights reserved.
//

#import "NSMutableAttributedString+Extension.h"
#import "CPKit.h"

@implementation NSMutableAttributedString (Extension)

+(NSMutableAttributedString *)attributedWithString:(NSString *)str
                                             color:(UIColor *)color
                                              font:(UIFont *)font{
    return [[NSMutableAttributedString alloc] initWithString:CPString(str) attributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font}];
    
}

@end

