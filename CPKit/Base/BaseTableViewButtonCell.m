//
//  BaseTableViewButtonCell.m
//  SSZS
//
//  Created by Mac on 2018/9/20.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "BaseTableViewButtonCell.h"
#import "CPKit.h"

@interface BaseTableViewButtonCell ()

@end

@implementation BaseTableViewButtonCell

#pragma mark - set
- (void)setRightSpacingForButton:(CGFloat)rightSpacingForButton
{
    _rightSpacingForButton = rightSpacingForButton;
    [self.contentView updateConstraints];
}

#pragma mark - Life
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupLayout];
    }
    return self;
}

#pragma mark - Public


#pragma mark - Private
- (void)setupLayout
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView addSubview:self.button];
    
    self.textLabel.sd_layout
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, CPAuto(15));
    [self.textLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.button.sd_layout
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, self.rightSpacingForButton)
    .leftSpaceToView(self.textLabel, CPAuto(15));
    
}

#pragma mark - Get
- (UIButton *)button
{
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _button.titleLabel.font = CPFont_Regular(14);
//        _button.userInteractionEnabled = NO;
        kWeakObject(self)
        [[_button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            kStrongObject(self)
            if (self.cpDelegate && [self.cpDelegate respondsToSelector:@selector(baseTableViewButtonCell:clickButton:)]) {
                [self.cpDelegate baseTableViewButtonCell:self clickButton:self.button];
            }
        }];
    }
    return _button;
}


@end
