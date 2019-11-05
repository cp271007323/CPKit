//
//  CPBaseTextView.m
//  TeaServiceCompany
//
//  Created by TeaServiceCompany on 2019/7/31.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import "CPBaseTextView.h"
#import "CPKit.h"

@interface CPBaseTextView ()<
UITextViewDelegate>

@property (nonatomic , strong , readwrite) UITextView *textView;

@property (nonatomic , strong , readwrite) UITextView *placeholdTextView;

@property (nonatomic , assign) NSInteger toNumber;

@property (nonatomic , assign , readwrite) NSInteger currentLength;

@end

@implementation CPBaseTextView

#pragma mark - set
- (void)setTextInset:(UIEdgeInsets)textInset
{
    self.textView.textContainerInset = textInset;
    self.placeholdTextView.textContainerInset = textInset;
}

- (void)setTextFont:(UIFont *)textFont
{
    self.textView.font = textFont;
    self.placeholdTextView.font = textFont;
}

#pragma mark - Life
+ (instancetype)baseTextView
{
    return [[CPBaseTextView alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.textInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [self setupLayout];
        [self setupBingding];
    }
    return self;
}

#pragma mark - Public


#pragma mark - Private
- (void)setupLayout
{
    self.limitMaxCount = 200;
    
    [self addSubview:self.textView];
    [self addSubview:self.placeholdTextView];
    
    
    self.textView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self);
    
    self.placeholdTextView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomEqualToView(self);
    
}

- (void)setupBingding{
    kWeakObject(self)
    [[self.textView rac_textSignal] subscribeNext:^(NSString * _Nullable x)
     {
         kStrongObject(self)
         NSInteger lenth = [self convertToInt:x];
         if (lenth > self.limitMaxCount)
         {
             if (self.cpDelegate && [self.cpDelegate respondsToSelector:@selector(baseTextViewForInputMoreThanLimit:)])
             {
                 [self.cpDelegate baseTextViewForInputMoreThanLimit:self];
             }
             self.textView.text = [x substringToIndex:self.toNumber - 1];
         }
         BOOL flag = self.textView.text.length != 0;
         self.placeholdTextView.hidden = flag;
         self.currentLength = self.textView.text.length;
     }];
    
}

//判断中英混合的的字符串长度
- (NSInteger)convertToInt:(NSString*)strtemp{
    self.toNumber = 1;
    NSInteger number = 0;
    for (NSInteger i = 0; i < strtemp.length; i++)
    {
        unichar p = [strtemp characterAtIndex:i];
        if (p >= 0x4E00)
        {
            number += 2;
        }else{
            number += 1;
        }
        if (number <= self.limitMaxCount)
        {
            self.toNumber = i + 1;
        }
    }
    return number;
}

#pragma mark - Get
- (UITextView *)textView
{
    if (_textView == nil)
    {
        _textView = [[UITextView alloc] init];
        _textView.contentInset = UIEdgeInsetsZero;
        _textView.backgroundColor = [UIColor clearColor];
        _textView.font = CPFont_Regular(15);
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0
        if (@available(iOS 11.0, *))
        {
            _textView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
#endif
    }
    return _textView;
}

- (UITextView *)placeholdTextView
{
    if (_placeholdTextView == nil)
    {
        _placeholdTextView = [[UITextView alloc] init];
        _placeholdTextView.contentInset = UIEdgeInsetsZero;
        _placeholdTextView.backgroundColor = [UIColor clearColor];
        _placeholdTextView.font = CPFont_Regular(15);
        _placeholdTextView.editable = NO;
        _placeholdTextView.userInteractionEnabled = NO;
        _placeholdTextView.textColor = CPColor(@"e5e5e5");
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0
        if (@available(iOS 11.0, *))
        {
            _placeholdTextView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
#endif
    }
    return _placeholdTextView;
}

@end
