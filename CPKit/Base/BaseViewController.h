//
//  BaseViewController.h
//  Antique_Shop
//
//  Created by 陈平 on 2019/8/22.
//  Copyright © 2019 RuoXi. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

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

NS_ASSUME_NONNULL_END
