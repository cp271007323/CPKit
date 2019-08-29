//
//  NSMutableAttributedString+Extension.h
//  RouXiAntique_Shop
//
//  Created by RouXiAntique_Shop on 2017/12/5.
//  Copyright © 2017年 RouXiAntique_Shop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (Extension)

/**
 富文本生成
 */
+(NSMutableAttributedString *)attributedWithString:(NSString *)str
                                             color:(UIColor *)color
                                              font:(UIFont *)font;

@end
