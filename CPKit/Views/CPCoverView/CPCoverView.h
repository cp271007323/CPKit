//
//  CPCoverView.h
//  chenp
//
//  Created by chenp on 2019/7/6.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPCoverView : UIView

@property (nonatomic , strong) UIButton *coverBtn;

@property (nonatomic , strong) UIView *backView;

+(instancetype)coverView;

- (void)showCoverView;

- (void)dissCoverView;
@end
