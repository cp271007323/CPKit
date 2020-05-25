//
//  CPBaseTextView.h
//  Mac
//
//  Created by Mac on 2019/7/31.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CPBaseTextViewDelegate;

@interface CPBaseTextView : UIView

/**
 文本框
 */
@property (nonatomic , strong , readonly) UITextView *textView;

/**
 提示符
 */
@property (nonatomic , strong , readonly) UITextView *placeholdTextView;

/**
 代理
 */
@property (nonatomic , assign) id<CPBaseTextViewDelegate> cpDelegate;

/**
 字体类型
 */
@property (nonatomic , strong) UIFont *textFont;

/**
 文字偏移量
 */
@property (nonatomic , assign) UIEdgeInsets textInset;

/**
 限制最大个数（默认200）
 */
@property (nonatomic , assign) NSInteger limitMaxCount;

/**
 当前位数
 */
@property (nonatomic , assign , readonly) NSInteger currentLength;

/**
 初始化
 */
+ (instancetype)baseTextView;

@end

@protocol CPBaseTextViewDelegate <NSObject>

@optional

/**
 输入超过限制
 */
- (void)baseTextViewForInputMoreThanLimit:(CPBaseTextView *)textView;


@required


@end



