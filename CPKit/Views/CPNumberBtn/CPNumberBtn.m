//
//  CPNumberBtn.m
//  yuexia
//
//  Created by 陈平 on 2018/4/19.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import "CPNumberBtn.h"
#import "CPKit.h"
#import <SDAutoLayout/SDAutoLayout.h>

@interface CPNumberBtn ()

@property (nonatomic , assign) BOOL isLayoutForImageView;

@end

@implementation CPNumberBtn

#pragma mark - set
- (void)setNumber:(NSInteger)number
{
    self.roundLab.number = number;
}

- (void)setTopSpacing:(CGFloat)topSpacing
{
    _topSpacing = topSpacing;
}

#pragma mark - Life
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupInitForCPNumberBtn];
        [self setupBingdingForCPNumberBtn];
        self.topSpacing = -10;
    }
    return self;
}

#pragma mark - Pravite
-(void)setupInitForCPNumberBtn
{
    [self setTitle:@"" forState:UIControlStateNormal];
    [self addSubview:self.roundLab];
    [self bringSubviewToFront:self.roundLab];
}

-(void)setupBingdingForCPNumberBtn
{
    
}

#pragma mark - Public
- (void)updateRoundForImageView
{
    self.roundLab.sd_layout
    .rightEqualToView(self.imageView).offset(CPAuto(10))
    .topEqualToView(self.imageView).offset(self.topSpacing);
    self.roundLab.layer.borderWidth = 1;
    self.roundLab.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.roundLab setSd_cornerRadiusFromHeightRatio:@0.5];
}

- (void)updateRoundForTitleLabel
{
    self.roundLab.sd_layout
    .rightEqualToView(self.titleLabel).offset(CPAuto(10))
    .topEqualToView(self.titleLabel).offset(self.topSpacing);
    self.roundLab.layer.borderWidth = 1;
    self.roundLab.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.roundLab setSd_cornerRadiusFromHeightRatio:@0.5];
    [self insertSubview:self.roundLab aboveSubview:self.titleLabel];
}

#pragma mark - get
-(CPRoundLab *)roundLab
{
    if (_roundLab == nil)
    {
        _roundLab = [[CPRoundLab alloc] init];
        _roundLab.number = 0;
    }
    return _roundLab;
}



@end

