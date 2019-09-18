//
//  CPCoverView.m
//  RouXiAntique_Shop
//
//  Created by RouXiAntique_Shop on 2019/7/6.
//  Copyright © 2018年 RouXiAntique_Shop. All rights reserved.
//

#import "CPCoverView.h"
#import "CPKit.h"

@interface CPCoverView ()

@end

@implementation CPCoverView

#pragma mark - Life
+(instancetype)coverView{
    return [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self)
        {
        [self setupInitForCPCoverView];
        [self setupBingdingForCPCoverView];
    }
    return self;
}

#pragma mark - Pravite
- (void)setupInitForCPCoverView{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.6];
    [self addSubview:self.coverBtn];
    [self addSubview:self.backView];
    
    self.backView.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .widthIs(CPAuto(245))
    .heightIs(CPAuto(287));
    
    self.coverBtn.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .bottomEqualToView(self)
    .rightEqualToView(self);

}

- (void)setupBingdingForCPCoverView{
    
}

#pragma mark - Public
- (void)showCoverView{
    [[UIView getCurrentRootViewController].view addSubview:self];
}

- (void)dissCoverView{
    [self removeFromSuperview];
}

#pragma mark - get
- (UIView *)backView{
    if (_backView == nil)
        {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

- (UIButton *)coverBtn{
    if (_coverBtn == nil)
        {
        _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _coverBtn;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
