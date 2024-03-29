//
//  BaseTableViewTextFieldCell.m
//  SSZS
//
//  Created by Mac on 2018/9/20.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "BaseTableViewTextFieldCell.h"
#import "CPKit.h"

@interface BaseTableViewTextFieldCell ()

@end

@implementation BaseTableViewTextFieldCell

#pragma mark - set
- (void)setRightSpacingForTextFieldView:(CGFloat)rightSpacingForTextFieldView
{
    _rightSpacingForTextFieldView = rightSpacingForTextFieldView;
    [self.contentView updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView addSubview:self.textFieldView];
    
    self.textLabel.sd_layout
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, CPAuto(15));
    [self.textLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.textFieldView.sd_layout
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, self.rightSpacingForTextFieldView)
    .leftSpaceToView(self.textLabel, CPAuto(15));
}

#pragma mark - Get
- (UITextField *)textFieldView
{
    if (_textFieldView == nil) {
        _textFieldView = [UITextField new];
        _textFieldView.textAlignment = NSTextAlignmentRight;
        _textFieldView.font = CPFont_Regular(14);
    }
    return _textFieldView;
}


@end
