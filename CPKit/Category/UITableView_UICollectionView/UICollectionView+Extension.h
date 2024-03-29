//
//  UICollectionView+Extension.h
//  SSZS
//
//  Created by Mac on 2019/7/17.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPStatusTypeView.h"

@interface UICollectionView (Extension)

/**
 背景视图
 */
@property (nonatomic , strong) CPStatusTypeView *backView;

/**
 不显示背景视图
 */
@property (nonatomic , assign) BOOL unShowBackView;

/**
 是否可以滑动背景视图
 */
@property (nonatomic , assign) BOOL canScrollBackView;

/**
 显示backView,忽略section的数组
 */
@property (nonatomic , strong) NSMutableArray<NSNumber *> *ignoreSectionShowBackViewArr;

@end
