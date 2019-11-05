//
//  UIView+CPFrame.h
//  CP_Category
//
//  Created by chenp on 17/5/18.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CPFrame)

@property CGFloat CP_Width;
@property CGFloat CP_Height;
@property CGFloat CP_X;
@property CGFloat CP_Y;
@property CGFloat CP_CenterX;
@property CGFloat CP_CenterY;

@property CGFloat CP_right;
@property CGFloat CP_bottom;
@end

@interface UIView (CPline)

- (UIView *)addBottomLineWithOffset:(CGFloat)offset color:(UIColor *)color;
- (UIView *)addBottomLineWithOffset:(CGFloat)offset color:(UIColor *)color height:(CGFloat)height;
- (UIView *)addBottomLineWithOffset:(CGFloat)offset left:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height;

- (UIView *)addTopLineWithOffset:(CGFloat)offset color:(UIColor *)color;
- (UIView *)addTopLineWithOffset:(CGFloat)offset color:(UIColor *)color height:(CGFloat)height;
- (UIView *)addTopLineWithOffset:(CGFloat)offset left:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height;

- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color;
- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color width:(CGFloat)width;
- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width height:(CGFloat)height;

- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color;
- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width;
- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width height:(CGFloat)height;

- (UIView *)addCenterDotLine;

@end

@interface UIView (CPExtension)

#pragma mark - 添加阴影
- (void)addShadow;

- (void)addShadowWithOffset:(CGSize)offset;

- (void)addShadowWithOffset:(CGSize)offset color:(UIColor *)color radius:(CGFloat)radius opacity:(CGFloat)opacity;

#pragma mark - 获取当前控制器
/**
 由当前视图获取根控制器
*/
- (UIViewController *)getSupreViewController;

/**
 当前所在的控制器
 */
+ (UIViewController*)getCurrentViewController;

/**
 获取当前模式根层控制器
 */
+ (UIViewController*)getCurrentRootViewController;


#pragma mark - 去除滚动视图安全区
+ (void)contentInsetAdjustmentBehaviorFor:(__kindof UIScrollView *)scrollView;

#pragma mark - 修改状态栏的颜色
+ (void)statusBarBackgroundColor:(UIColor *)color;

#pragma mark - 去除tableView刷新cell弹跳
+ (void)estimatedForTableView:(__kindof UITableView *)tableView;


@end


 
