//
//  BaseTableViewHeaderFooterView.m
//  Mac
//
//  Created by Mac on 2017/11/28.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "BaseTableViewHeaderFooterView.h"
#import "CPKit.h"

@interface BaseTableViewHeaderFooterView ()

@property (nonatomic , strong, readwrite) UILabel *titleLab;

@property (nonatomic , strong, readwrite) UIButton *nextBtn;

@end


@implementation BaseTableViewHeaderFooterView

#pragma mark - set
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLab.text = title;
}

- (void)setShowNextImage:(BOOL)showNextImage
{
    self.nextBtn.hidden = !showNextImage;
}

#pragma mark - 生命周期
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.nextBtn];
    
    self.titleLab.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, CPAuto(24), 0, 0));
    
    self.nextBtn.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, CPAuto(15)));
    
}

#pragma mark - Public Method
+ (NSString *)identifier{
    return NSStringFromClass([self class]);
}

#pragma mark - get
- (UILabel *)titleLab
{
    if (_titleLab == nil) {
        _titleLab = [UILabel new];
        _titleLab.textColor = CPColor(@"444444");
        _titleLab.font = CPFont_Regular(15);
    }
    return _titleLab;
}

- (UIButton *)nextBtn
{
    if (_nextBtn == nil) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setImage:CPImageName(@"to_promote_list_more") forState:UIControlStateNormal];
        [_nextBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        _nextBtn.hidden = YES;
    }
    return _nextBtn;
}

@end

