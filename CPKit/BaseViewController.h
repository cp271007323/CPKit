//
//  BaseViewController.h
//  MeetCarefree
//
//  Created by 陈平 on 2017/10/13.
//  Copyright © 2017年 xxf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPStatusTypeView.h" 
#import "UIViewController+CP_Extension.h"

@protocol BaseViewControllerDelegate <NSObject>

@required

@end


@interface BaseViewController : UIViewController<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

/**
 当前控制器
 */
@property (nonatomic , assign) BOOL isCurrentVC;

/**
 基础代理
 */
@property (nonatomic , assign) id<BaseViewControllerDelegate> baseDelegate;

/**
 当前刷新是否为顶部下拉刷新
 */
@property (nonatomic , assign) BOOL isRefreshForHead;

/**
 写入控制器标题和颜色
 */
- (void)setViewControllerTitle:(NSString *)title color:(UIColor *)color;

/**
 隐藏导航栏底部线 透明导航栏
 */
- (void)hiddenNavgationBarBottomLine:(BOOL)isHidden alphaNavgationBar:(BOOL)isAlpha;

/**
 显示导航栏图片
 */
- (void)showNavigationBarImage:(BOOL)show;

@end
