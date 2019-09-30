//
//  UITextField+Extension.h
//  chenp
//
//  Created by chenp on 2017/11/15.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UITextFieldLimitHandler)(void);

@interface UITextField (Extension)

@property (nonatomic , strong) UIColor * _Nullable placeholdColor;

@property (nonatomic , strong) UIFont * _Nullable placeholdFont;

/**
 限制输入框文本的长度
 */
+(NSInteger)limitTextField:(UITextField *_Nonnull)textField limitNumber:(NSInteger)number limitHandeler:(_Nullable UITextFieldLimitHandler)limitHandeler;

@end
