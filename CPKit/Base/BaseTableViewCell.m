//
//  BaseTableViewCell.m
//  Mac
//
//  Created by Mac on 2017/10/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "CPKit.h"

@interface BaseTableViewCell ()

@property (nonatomic , strong) UIView *bottomLine;

@end


@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupBingdingForBase];
    }
    return self;
}

- (void)setupBingdingForBase
{
    kWeakObject(self)
    [RACObserve(self, accessoryType) subscribeNext:^(id  _Nullable x) {
        kStrongObject(self)
        if (self.accessoryType == UITableViewCellAccessoryDisclosureIndicator)
        {
            [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[UIButton class]])
                {
                    UIButton *btn = (UIButton *)obj;
                    [btn setBackgroundImage:CPImageName(@"to_promote_list_more") forState:UIControlStateNormal];
                }
            }];
        }
    }];
}

- (void)addBottomLineWithleft:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height
{
    if (self.bottomLine)
    {
        [self.bottomLine removeFromSuperview];
        self.bottomLine = nil;
    }
    self.bottomLine = [self addBottomLineWithOffset:0 left:left right:right color:color height:height];
}


+(NSString *)identifier{
    return NSStringFromClass(self);
}

@end

@implementation BaseTableViewValue1Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setupBingdingForBaseValue1];
    }
    return self;
}

- (void)setupBingdingForBaseValue1
{
    
}

@end
