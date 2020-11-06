//
//  BaseViewController.h
//  Antique_Shop
//
//  Created by Mac on 2019/8/22.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPHeadGifRefresh.h"
#import "CPFootRefresh.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

/// 导航栏自定义视图
@property (nonatomic , strong) UIView *navBarView;

/// 当前控制器
@property (nonatomic , assign) BOOL isCurrentVC;

/// 当前刷新是否为顶部下拉刷新
@property (nonatomic , assign) BOOL isRefreshForHead;

/// 下拉刷新控件
@property (nonatomic , strong) CPHeadGifRefresh *headRefresh;

/// 上拉刷新控件
@property (nonatomic , strong) CPFootRefresh *footRefresh;

///刷新页数
@property (nonatomic , assign) int32_t refreshPage;


/// 写入控制器标题和颜色
- (void)setViewControllerTitle:(NSString *)title color:(UIColor *)color;

/// 隐藏导航栏底部线 透明导航栏
- (void)hiddenNavgationBarBottomLine:(BOOL)isHidden alphaNavgationBar:(BOOL)isAlpha;

/// 显示导航栏图片
- (void)showNavigationBarImage:(BOOL)show image:(UIImage *)image;

/// 更新自定义导航视图的高度 同时可以做布局操作
- (void)updateNavBarViewForHeight:(CGFloat)height layout:(void (^)(UIView *navBarView))layoutBlock;

/// 下拉走的方法
- (void)refreshForHeader;

/// 上拉走的方法
- (void)refresgForFooter;

/// 返回刷新的页码
- (NSInteger)refresgForFooterPage;

@end

NS_ASSUME_NONNULL_END
