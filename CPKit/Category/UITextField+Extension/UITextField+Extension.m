//
//  UITextField+Extension.m
//  Mac
//
//  Created by Mac on 2017/11/15.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UITextField+Extension.h"
#import "CPKit.h"

@implementation UITextField (Extension)

+ (void)load
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method oldMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
        Method newMethod = class_getInstanceMethod(self, @selector(cp_setPlaceholder:));
        
        method_exchangeImplementations(oldMethod, newMethod);
    });


}

- (void)setPlaceholdColor:(UIColor *)placeholdColor
{
    [self setValue:placeholdColor forKeyPath:@"placeholderLabel.textColor"];
    objc_setAssociatedObject(self, @selector(placeholdColor), placeholdColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)placeholdColor
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPlaceholdFont:(UIFont *)placeholdFont
{
    [self setValue:placeholdFont forKeyPath:@"placeholderLabel.font"];
    objc_setAssociatedObject(self, @selector(placeholdFont), placeholdFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIFont *)placeholdFont
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)cp_setPlaceholder:(NSString *)placeholder
{
    [self cp_setPlaceholder:placeholder];

    if (self.placeholdFont) {
        self.placeholdFont = self.placeholdFont;
    }

    if (self.placeholdColor) {
        self.placeholdColor = self.placeholdColor;
    }

}

+(NSInteger)limitTextField:(UITextField *_Nonnull)textField limitNumber:(NSInteger)number limitHandeler:(_Nullable UITextFieldLimitHandler)limitHandeler;
{
    NSString *toBeString = textField.text;
    // 键盘输入模式
    NSString *lang = textField.textInputMode.primaryLanguage;
    
    // 简体中文输入，包括简体拼音，健体五笔，简体手写
    if ([lang isEqualToString:@"zh-Hans"])
    {
        UITextRange *selectedRange = [textField markedTextRange];
        
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position || !selectedRange)
        {
            if (toBeString.length > number)
            {
                textField.text = @"";
                [textField insertText:[toBeString substringToIndex:number]];
                
                if (limitHandeler)
                {
                    limitHandeler();
                }
            }
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else
    {
        if (toBeString.length > number)
        {
            textField.text = @"";
            [textField insertText:[toBeString substringToIndex:number]];
            if (limitHandeler)
            {
                limitHandeler();
            }
        }
    }
    return textField.text.length;
}


@end

