//
//  UITableView+Extension.h
//  MeetAll
//
//  Created by chenp on 2019/7/2.
//  Copyright © 2018年 chenp. All rights reserved.
//
 
#import <UIKit/UIKit.h>
#import "CPStatusTypeView.h"

@interface UITableView (Extension)

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
