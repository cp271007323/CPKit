//
//  CPNumberBtn.h
//  yuexia
//
//  Created by 陈平 on 2018/4/19.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPRoundLab.h"

@interface CPNumberBtn : UIButton

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
