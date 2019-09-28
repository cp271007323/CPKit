//
//  BaseTableViewButtonCell.h
//  SSZS
//
//  Created by chenp on 2018/9/20.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import "BaseTableViewCell.h"

@protocol BaseTableViewButtonCellDelegate;

@interface BaseTableViewButtonCell : BaseTableViewCell

@property (nonatomic , strong) UIButton *button;

@property (nonatomic , assign) CGFloat rightSpacingForButton;

@property (nonatomic , assign) id<BaseTableViewButtonCellDelegate> cpDelegate;

@end

@protocol BaseTableViewButtonCellDelegate <NSObject>

@optional
- (void)baseTableViewButtonCell:(BaseTableViewButtonCell *)cell clickButton:(UIButton *)btn;


@required


@end

