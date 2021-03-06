//
//  CPNumberBtn.h
//  Mac
//
//  Created by Mac on 2018/4/19.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPRoundLab;

@interface CPNumberBtn : UIButton

/**
 点
 */
@property (nonatomic , strong) CPRoundLab *roundLab;

/**
 数量
 */
@property (nonatomic , assign) NSInteger number;

/**
 顶部距离
 */
@property (nonatomic , assign) CGFloat topSpacing;



/**
 相对图片更新布局
 */
- (void)updateRoundForImageView;

/**
 相对标签更新布局
 */
- (void)updateRoundForTitleLabel;

@end
