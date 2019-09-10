//
//  UIView+CPFrame.h
//  CP_Category
//
//  Created by RouXiAntique_Shop on 17/5/18.
//  Copyright © 2017年 KKJY. All rights reserved.
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

@interface UIView (line)

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

#pragma mark - 添加阴影
- (void)addShadow;

- (void)addShadowWithOffset:(CGSize)offset;

- (void)addShadowWithOffset:(CGSize)offset color:(UIColor *)color radius:(CGFloat)radius opacity:(CGFloat)opacity;

#pragma mark - 获取当前控制器
+ (UIViewController *)getViewController;

+ (UIViewController *)getCurrentVC;

+ (UIViewController*)getTopViewController;

+ (UIViewController *)getTopCurrentVC;

#pragma mark - 去除滚动视图安全区
+ (void)contentInsetAdjustmentBehaviorFor:(__kindof UIScrollView *)scrollView;

#pragma mark - 修改状态栏的颜色
+ (void)statusBarBackgroundColor:(UIColor *)color;

#pragma mark - 去除tableView刷新cell弹跳
+ (void)estimatedForTableView:(__kindof UITableView *)tableView;

+ (void)showAletViewWithTitle:(NSString *)title
                      message:(NSString *)message
                     btnTitle:(NSString *)btnTitle
                btnTitleColor:(UIColor *)btnTitleColor
                btnTitleBlock:(void (^)(void))btnTitleBlock;

+ (void)showAletViewWithTitle:(NSString *)title
                      message:(NSString *)message
                     btnTitle:(NSString *)btnTitle
                btnTitleColor:(UIColor *)btnTitleColor
                btnTitleBlock:(void (^)(void))btnTitleBlock
                  subBtnTitle:(NSString *)subBtnTitle
             subBtnTitleColor:(UIColor *)subBtnTitleColor
             subBtnTitleBlock:(void (^)(void))subBtnTitleBlock;

+ (void)showAletViewAndCancelWithTitle:(NSString *)title
                               message:(NSString *)message
                              btnTitle:(NSString *)btnTitle
                         btnTitleColor:(UIColor *)btnTitleColor
                         btnTitleBlock:(void (^)(void))btnTitleBlock
                           subBtnTitle:(NSString *)subBtnTitle
                      subBtnTitleColor:(UIColor *)subBtnTitleColor
                      subBtnTitleBlock:(void (^)(void))subBtnTitleBlock;


@end


 
