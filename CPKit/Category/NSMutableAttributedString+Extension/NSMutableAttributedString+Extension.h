//
//  NSMutableAttributedString+Extension.h
//  Mac
//
//  Created by Mac on 2017/12/5.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (Extension)

/** 富文本生成 */
+(NSMutableAttributedString * _Nonnull)attributedWithString:(NSString * _Nonnull)str
                                                      color:(UIColor * _Nonnull)color
                                                       font:(UIFont * _Nonnull)font;

@end
