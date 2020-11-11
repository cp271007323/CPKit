//
//  CPBaseTextView.m
//  Mac
//
//  Created by Mac on 2019/7/31.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CPBaseTextView.h"
#import "CPKit.h"

@interface CPBaseTextView ()<
UITextViewDelegate>

@property (nonatomic , strong , readwrite) UITextView *textView;

@property (nonatomic , strong , readwrite) UITextView *placeholdTextView;

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
    [[self.textView rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        
         kStrongObject(self)
         self.placeholdTextView.hidden = self.textView.text.length != 0;
         self.currentLength = self.textView.text.length;
     }];
    
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (text.length == 0) return YES;
    
    //超过最大
    if (textView.text.length > self.limitMaxCount) {
        
        return NO;
    }
    else if ((textView.text.length + text.length) > self.limitMaxCount) {
        NSString *str = [NSString stringWithFormat:@"%@%@",textView.text,[text substringToIndex:(self.limitMaxCount - textView.text.length)]];
        textView.text = @"";
        [textView insertText:str];
        return NO;
    }
    return YES;
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
        _textView.delegate = self;
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
