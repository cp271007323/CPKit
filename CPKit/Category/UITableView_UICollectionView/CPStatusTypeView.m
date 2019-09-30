//
//  CPStatusTypeView.m
//  MeetAll
//
//  Created by chenp on 2019/7/2.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import "CPStatusTypeView.h"
#import "CPKit.h"

@interface CPStatusTypeView ()

/**
 中心线
 */
@property (nonatomic , strong) UIView *centerV;

/**
 菊花
 */
@property (nonatomic , strong) UIActivityIndicatorView *activityView;

/**
 回调代码块
 */
@property (nonatomic , copy) CPStatusTypeBlock callBackBlock;

/**
 设置信号
 */
@property (nonatomic , strong) RACCommand *signalCommand;

@end

@implementation CPStatusTypeView

#pragma mark - set
- (void)setTopSpace:(CGFloat)topSpace
{
    _topSpace = topSpace;
    self.imageView.sd_layout
    .centerXEqualToView(self)
    .widthIs(self.widthSpace)
    .heightEqualToWidth()
    .topSpaceToView(self, _topSpace);
    [self.imageView updateLayout];
}

- (void)setWidthSpace:(CGFloat)widthSpace
{
    _widthSpace = widthSpace;
    self.imageView.sd_layout
    .centerXEqualToView(self)
    .widthIs(widthSpace)
    .heightEqualToWidth()
    .topSpaceToView(self, self.topSpace);
    [self.imageView updateLayout];
}

#pragma mark - Life
+(instancetype)statusTypeView
{
    return [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self setupInitForCPStatusTypeView];
        [self setupBingdingForCPStatusTypeView];
    }
    return self;
}

#pragma mark - Pravite
- (void)setupInitForCPStatusTypeView
{
    self.centerV = [self addCenterDotLine];
    self.centerV.hidden = YES;
    [self addSubview:self.imageView];
    [self addSubview:self.contentLab];
    [self addSubview:self.submitBtn];
    [self.submitBtn addSubview:self.activityView];
    
    _topSpace = CPAuto(200);
    _widthSpace = CPAuto(100);
    
    self.imageView.sd_layout
    .centerXEqualToView(self)
    .widthIs(self.widthSpace)
    .heightEqualToWidth()
    .topSpaceToView(self, self.topSpace);
    
    self.contentLab.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self.imageView, CPAuto(10))
    .autoHeightRatio(0);
    [self.contentLab setSingleLineAutoResizeWithMaxWidth:CPScreenWidth()];
    
    self.submitBtn.sd_layout
    .centerXEqualToView(self)
    .widthIs(CPAuto(130))
    .heightIs(CPAuto(40))
    .topSpaceToView(self.contentLab, CPAuto(27));
    [self.submitBtn setSd_cornerRadiusFromHeightRatio:@0.5];
    
    self.activityView.sd_layout
    .centerXEqualToView(self.submitBtn)
    .centerYEqualToView(self.submitBtn);
    
}

- (void)setupBingdingForCPStatusTypeView
{
    kWeakObject(self)
    [RACObserve(self, type) subscribeNext:^(id  _Nullable x){
        kStrongObject(self)
        //无数据
        if (self.type == CPStatusType_NoData)
        {
            self.contentLab.text = @"空空如也";
            
            self.submitBtn.hidden = YES;
        }
        //网络异常
        else if (self.type == CPStatusType_FailNet)
        {
            [self.submitBtn setTitle:@"立即刷新" forState:UIControlStateNormal];
            if (self.activityView.isAnimating)
            {
                [self.activityView stopAnimating];
            }
            [self failNetConfig];
        }
        //未开启网络
        else if (self.type == CPStatusType_NoOpenNet)
        {
            [self.submitBtn setTitle:@"前往开启" forState:UIControlStateNormal];
            if (self.activityView.isAnimating)
            {
                [self.activityView stopAnimating];
            }
            [self noOpenNetConfig];
        }
        //其他
        else if (self.type == CPStatusType_other)
        {
            [self otherConfig];
        }
    }];
    
    
//    [RACObserve(self.activityView, animated) subscribeNext:^(id  _Nullable x){
//        kStrongObject(self)
//        //在动画
//        if ([x boolValue])
//        {
//            [self.submitBtn setTitle:nil forState:UIControlStateNormal];
//        }
//        //停止动画
//        else
//        {
//            [self.submitBtn setTitle:@"重新刷新" forState:UIControlStateNormal];
//        }
//    }];
    
    [[self rac_signalForSelector:@selector(removeFromSuperview)] subscribeNext:^(RACTuple * _Nullable x){
        kStrongObject(self)
        self.signalCommand = nil;
        self.callBackBlock = nil;
    }];
    
    [[self.submitBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id  _Nullable x){
        kStrongObject(self)
        if (self.type == CPStatusType_FailNet)
        {
            [self.activityView startAnimating];
            if (self.callBackBlock)
            {
                self.callBackBlock(self.type);
            }
        }
        else if (self.type == CPStatusType_NoOpenNet)
        {
            //            [CPSystemManager cpPresentTo:CPSystemSetting_MOBILE_DATA_SETTINGS_ID];
        }
        else if (self.type == CPStatusType_other)
        {
            if (self.callBackBlock)
            {
                self.callBackBlock(self.type);
            }
        }
    }];
}

- (void)failNetConfig
{
    
    self.contentLab.text = @"网络不给力";
    self.submitBtn.hidden = NO;
    //    [self.viewController.view bringSubviewToFront:self];
}

- (void)noOpenNetConfig
{
    self.contentLab.text = @"未开启网络";
    self.submitBtn.hidden = NO;
    //    [self.viewController.view addSubview:self];
    //    [self.viewController.view bringSubviewToFront:self];
}

- (void)otherConfig
{
    self.submitBtn.hidden = NO;
    //    [self.viewController.view addSubview:self];
    //    [self.viewController.view bringSubviewToFront:self];
}

#pragma mark - Public
- (void)setCommand:(RACCommand *)signalCommand refreshCallBack:(CPStatusTypeBlock)callBack
{
    self.signalCommand = signalCommand;
    self.callBackBlock = callBack;
    kWeakObject(self)
    [self.signalCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x){
        kStrongObject(self)
        //不为空
        if (x!= nil)
        {
            //判断是否元组类型
            if ([x isKindOfClass:[RACTuple class]])
            {
                if ([x[0] boolValue])
                {
                    [self.activityView stopAnimating];
                    [self removeFromSuperview];
                }
                else
                {
                    [self.activityView stopAnimating];
                }
            }
            //布尔值类型
            else
            {
                if ([x boolValue])
                {
                    [self.activityView stopAnimating];
                    [self removeFromSuperview];
                }
                else
                {
                    [self.activityView stopAnimating];
                }
            }
        }
        //为空
        else
        {
            [self.activityView stopAnimating];
            [self removeFromSuperview];
        }
    }];
    
}

#pragma mark - get
- (UIImageView *)imageView{
    if (_imageView == nil)
    {
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = CPImageName(@"图层 3198");
    }
    return _imageView;
}

- (UILabel *)contentLab{
    if (_contentLab == nil)
    {
        _contentLab = [UILabel new];
        _contentLab.font = CPFont_Regular(14);
        _contentLab.textColor = CPColor(@"999999");
    }
    return _contentLab;
}

- (UIButton *)submitBtn{
    if (_submitBtn == nil)
    {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitBtn setBackgroundImage:CPImageName(@"按钮1") forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = CPFont_Medium(18);
    }
    return _submitBtn;
}

- (UIActivityIndicatorView *)activityView{
    if (_activityView == nil)
    {
        _activityView = [[UIActivityIndicatorView alloc] init];
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    }
    return _activityView;
}

@end


