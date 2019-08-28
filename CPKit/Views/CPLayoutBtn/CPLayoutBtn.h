//
//  CPLayoutBtn.h
//  yuexia
//
//  Created by 陈平 on 2018/7/27.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import "CPNumberBtn.h"

@class CPLayoutBtn;

typedef void(^CPLayoutBlock)(CPLayoutBtn *btn,UIImageView *imageView , UILabel *titleLab);

@interface CPLayoutBtn : CPNumberBtn

+ (instancetype)buttonWithType:(UIButtonType)buttonType layout:(CPLayoutBlock)layoutBlock;

@end
