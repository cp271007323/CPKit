//
//  UITextView+Extension.m
//  YXMeiPo
//
//  Created by 陈平 on 2018/6/2.
//  Copyright © 2018年 yueke. All rights reserved.
//

#import "UITextView+Extension.h"


@implementation UITextView (Extension)

+(NSInteger)limitTextView:(UITextView *)textView
                   string:(NSString *)string
                   number:(NSInteger)number
{
    NSString *toBeString = textView.text;
    NSString *lang = textView.textInputMode.primaryLanguage; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"])
    { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position || !selectedRange)
        {
            if (toBeString.length > number)
            {
//                [MBProgressHUD showInfoHUD:string completeBlock:nil];
                textView.text = [toBeString substringToIndex:number];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else
        {
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else
    {
        if (toBeString.length > number)
        {
//            [MBProgressHUD showInfoHUD:string completeBlock:nil];
            textView.text = [textView.text substringToIndex:number];
        }
    }
    return textView.text.length;
}

@end
