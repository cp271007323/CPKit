//
//  CPRoundLab.m
//  MeetAll
//
//  Created by chenp on 2018/2/23.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import "CPRoundLab.h"

@interface CPRoundLab ()
@property (nonatomic , strong) UILabel *numberLab;
@end

@implementation CPRoundLab

#pragma mark - set
- (void)setNumber:(NSInteger)number
{
    _number = number;
}

#pragma mark - Life
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.pointWith = 11;
        [self setupInitForCPRoundLab];
        [self setupBingdingForCPRoundLab];
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setupInitForCPRoundLab];
        [self setupBingdingForCPRoundLab];
    }
    return self;
}

#pragma mark - Pravite
- (void)setupInitForCPRoundLab
{
    [self addSubview:self.numberLab];
    
    self.numberLab.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .widthIs(0)
    .heightIs(0);
    
    [self setupAutoWidthWithRightView:self.numberLab rightMargin:0];
    [self setupAutoHeightWithBottomView:self.numberLab bottomMargin:0];
}

- (void)setupBingdingForCPRoundLab
{
    kWeakObject(self)
    [RACObserve(self, number) subscribeNext:^(id  _Nullable x) {
        kStrongObject(self)
        
        self.hidden = self.number == 0 ? YES : NO;
        
        //数字
        if (self.type == CPRoundLabType_Number)
        {
            if (self.number != 0)
            {
                NSString *numberStr = [NSString stringWithFormat:@"%ld",self.number];
                if (self.number > 99)
                {
                    numberStr = @"99+";
                }
                self.numberLab.text = numberStr;
                [self updataNumberLayout];
            }
        }
        //点
        else
        {
            [self updataPointLayout];
        }
    }];
}

- (void)updataNumberLayout
{
    [self.numberLab sizeToFit];
    CGFloat width = self.numberLab.CP_Width;
    CGFloat height = self.numberLab.CP_Height;
    
    height += 2;
    if (self.number < 10)
    {
        width = height;
    }
    else
    {
        width += 10;
    }
    
    self.numberLab.sd_layout
    .widthIs(width)
    .heightIs(height);
    
    self.numberLab.layer.mask = shaperOLayer(width, height);
}

- (void)updataPointLayout
{
    CGFloat width = self.pointWith;
    CGFloat height = self.pointWith;
    
    self.numberLab.sd_layout
    .widthIs(width)
    .heightIs(height);
    
    self.numberLab.layer.mask = shaperOLayer(width, height);
}

#pragma mark - Public


#pragma mark - get
- (UILabel *)numberLab{
    if (_numberLab == nil)
    {
        _numberLab = [UILabel new];
        _numberLab.textColor = [UIColor whiteColor];
        _numberLab.backgroundColor = [UIColor redColor];
        _numberLab.font = CPFont_Regular(11);
        _numberLab.textAlignment = NSTextAlignmentCenter;;
    }
    return _numberLab;
}


@end

