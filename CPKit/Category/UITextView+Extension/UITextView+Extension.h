//
//  UITextView+Extension.h
//  YXMeiPo
//
//  Created by 陈平 on 2018/6/2.
//  Copyright © 2018年 yueke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Extension)

/**
 限制字数
 */
+(NSInteger)limitTextView:(UITextView *)textView
                   string:(NSString *)string
                   number:(NSInteger)number;

@end
