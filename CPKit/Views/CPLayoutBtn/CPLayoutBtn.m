//
//  CPLayoutBtn.m
//  yuexia
//
//  Created by 陈平 on 2018/7/27.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import "CPLayoutBtn.h"

@interface CPLayoutBtn ()

@property (nonatomic , copy) CPLayoutBlock layoutBlock;

@end


@implementation CPLayoutBtn

#pragma mark - Life

+ (instancetype)buttonWithType:(UIButtonType)buttonType layout:(CPLayoutBlock)layoutBlock
{
    CPLayoutBtn *btn = [CPLayoutBtn buttonWithType:UIButtonTypeCustom];
    btn.layoutBlock = layoutBlock;
    return btn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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
    
    if (self.layoutBlock) self.layoutBlock(self, self.imageView, self.titleLabel);
}

#pragma mark - Get

@end
