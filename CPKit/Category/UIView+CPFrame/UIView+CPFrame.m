//
//  UIView+CPFrame.m
//  CP_Category
//
//  Created by Mac on 17/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UIView+CPFrame.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import "CPKit.h"

@implementation UIView (CPFrame)

- (void)setCP_Width:(CGFloat)CP_Width{
    CGRect rect = self.frame;
    rect.size.width = CP_Width;
    self.frame = rect;
}

- (CGFloat)CP_Width{
    return self.frame.size.width;
}

- (void)setCP_Height:(CGFloat)CP_Height{
    CGRect rect = self.frame;
    rect.size.height = CP_Height;
    self.frame = rect;
}

- (CGFloat)CP_Height{
    return self.frame.size.height;
}

- (void)setCP_X:(CGFloat)CP_X{
    CGRect rect = self.frame;
    rect.origin.x = CP_X;
    self.frame = rect;
}

- (CGFloat)CP_X{
    return self.frame.origin.x;
}

- (void)setCP_Y:(CGFloat)CP_Y{
    CGRect rect = self.frame;
    rect.origin.y = CP_Y;
    self.frame = rect;
}

- (CGFloat)CP_Y{
    return self.frame.origin.y;
}

- (void)setCP_CenterX:(CGFloat)CP_CenterX{
    CGPoint p = self.center;
    p.x = CP_CenterX;
    self.center = p;
}

- (CGFloat)CP_CenterX{
    return self.center.x;
}

- (void)setCP_CenterY:(CGFloat)CP_CenterY{
    CGPoint p = self.center;
    p.y = CP_CenterY;
    self.center = p;
}

- (CGFloat)CP_CenterY{
    return self.center.y;
}

- (CGFloat)CP_right{
    return self.CP_X + self.CP_Width;
}

- (CGFloat)CP_bottom{
    return self.CP_Y + self.CP_Height;
}

- (void)setCP_right:(CGFloat)CP_right{
    self.CP_X = CP_right - self.CP_Width;
}

- (void)setCP_bottom:(CGFloat)CP_bottom{
    self.CP_Y = CP_bottom - self.CP_Height;
}
@end

@implementation UIView (CPline)

- (UIView *)addBottomLineWithOffset:(CGFloat)offset color:(UIColor *)color
{
    return [self addBottomLineWithOffset:offset color:color height:0.5];
}

- (UIView *)addBottomLineWithOffset:(CGFloat)offset color:(UIColor *)color height:(CGFloat)height
{
    return [self addBottomLineWithOffset:offset left:0 right:0 color:color height:height];
}

- (UIView *)addBottomLineWithOffset:(CGFloat)offset left:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    
    line.sd_layout.rightEqualToView(self).offset(-right).leftEqualToView(self).offset(left).heightIs(height).bottomSpaceToView(self, offset);
    return line;
}

- (UIView *)addTopLineWithOffset:(CGFloat)offset color:(UIColor *)color
{
    return [self addTopLineWithOffset:offset color:color height:0.5];
}

- (UIView *)addTopLineWithOffset:(CGFloat)offset color:(UIColor *)color height:(CGFloat)height
{
    return [self addTopLineWithOffset:offset left:0 right:0 color:color height:height];
}

- (UIView *)addTopLineWithOffset:(CGFloat)offset left:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
    {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.rightSpaceToView(self, right).leftSpaceToView(self, left).heightIs(height).topSpaceToView(self, offset);
    return line;
}

- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color
{
    return [self addLeftLineWithOffset:offset color:color width:0.5];
}

- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.topEqualToView(self).bottomEqualToView(self).leftSpaceToView(self, offset).widthIs(width);
    return line;
}

- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width height:(CGFloat)height
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.centerYEqualToView(self).heightIs(height).leftSpaceToView(self, offset).widthIs(width);
    return line;
}


- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color
{
    return [self addRightLineWithOffset:offset color:color width:0.5];
}

- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.topEqualToView(self).bottomEqualToView(self).rightSpaceToView(self, offset).widthIs(width);
    return line;
}

- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width height:(CGFloat)height
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.centerYEqualToView(self).heightIs(height).rightSpaceToView(self, offset).widthIs(width);
    return line;
}

- (UIView *)addCenterDotLine{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor clearColor];
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.centerXEqualToView(self).centerYEqualToView(self).widthIs(1).heightIs(1);
    return line;
}

@end

@implementation UIView (CPExtension)

#pragma mark - 添加阴影
- (void)addShadow
{
    [self addShadowWithOffset:CGSizeMake(0, 0) color:[[UIColor blackColor] colorWithAlphaComponent:.8] radius:3 opacity:.7];
}

- (void)addShadowWithOffset:(CGSize)offset
{
    [self addShadowWithOffset:offset color:[[UIColor blackColor] colorWithAlphaComponent:.3] radius:3 opacity:.7];
}

- (void)addShadowWithOffset:(CGSize)offset color:(UIColor *)color radius:(CGFloat)radius opacity:(CGFloat)opacity
{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

#pragma mark - 获取当前控制器

+ (UIWindow *)getWindow
{
    UIWindow* window = nil;
    
    if (@available(iOS 13.0, *))
    {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
        {
            if (windowScene.activationState == UISceneActivationStateForegroundActive)
            {
                window = windowScene.windows.firstObject;
                break;
            }
        }
    }else{
        window = [UIApplication sharedApplication].keyWindow;
    }
    return window;
}

/// 由当前视图获取根控制器
- (UIViewController *)getSupreViewController
{
//此处的self.view指的是：如果你想获取的是控制器所在的父控制器，传入的是你当前控制器的view；如果想获取的是一个view的父控制器，直接传当前view本身就可以了
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

/**
 当前所在的控制器
// */
+ (UIViewController*)getCurrentViewController;
{
    UIViewController *currentVC = nil;
    UIViewController *topVC = nil;
    
    
    id appRootNav = [self getWindow].rootViewController;
    
    if ([appRootNav isKindOfClass:[UITabBarController class]])
    {
        //获取当前页面显示所在的控制器
        while ([appRootNav isKindOfClass:[UITabBarController class]])
        {
            if ([appRootNav isKindOfClass:[UITabBarController class]])
            {
                UITabBarController *tabBarVC = (UITabBarController *)appRootNav;
                __kindof UIViewController *appRootVC = tabBarVC.viewControllers[tabBarVC.selectedIndex];
                topVC = appRootVC;
            }
            else
            {
                __kindof UIViewController *appRootVC = appRootNav;
                topVC = appRootVC;
            }
            appRootNav = topVC;
        }
    }
    else
    {
        topVC = appRootNav;
    }
    
    //有模态情况下的根视图
    if (topVC.presentedViewController &&
        ![topVC.presentedViewController isKindOfClass:[UIAlertController class]])
    {
        do {
            topVC = topVC.presentedViewController;
            
        } while (topVC.presentedViewController &&
                 ![topVC.presentedViewController isKindOfClass:[UIAlertController class]]);
        currentVC = topVC;
    }
    //获取非模态情况下的根视图
    else
    {
        currentVC = topVC;
    }
    return currentVC;
}

+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [self getWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        while ([nextResponder isKindOfClass:[UITabBarController class]])
        {
            if ([nextResponder isKindOfClass:[UITabBarController class]])
            {
                UITabBarController *tabBarVC = (UITabBarController *)nextResponder;
                __kindof UIViewController *appRootVC = tabBarVC.viewControllers[tabBarVC.selectedIndex];
                result = appRootVC;
            }
            else
            {
                __kindof UIViewController *appRootVC = nextResponder;
                result = appRootVC;
            }
            nextResponder = result;
        }
    }
    else
    {
        result = window.rootViewController;
    }
    return result;
}

/**
// 获取当前模式根层控制器
// */
+ (UIViewController*)getCurrentRootViewController
{
    UIViewController *currentVC = nil;
    UIViewController *topVC = [self getWindow].rootViewController;
    
    //有模态情况下的根视图
    if (topVC.presentedViewController)
    {
        while (topVC.presentedViewController &&
               ![topVC.presentedViewController isKindOfClass:[UIAlertController class]])
        {
            topVC = topVC.presentedViewController;
        }
        currentVC = topVC;
    }
    //获取非模态情况下的根视图
    else
    {
        currentVC = topVC;
    }
    return currentVC;
}


#pragma mark - 去除滚动视图安全区
+ (void)contentInsetAdjustmentBehaviorFor:(__kindof UIScrollView *)scrollView
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0
    if (@available(iOS 11.0, *))
    {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
#endif
    [UIView getCurrentViewController].navigationController.automaticallyAdjustsScrollViewInsets = NO;
    [UIView getCurrentViewController].automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - 去除tableView刷新cell弹跳
+ (void)estimatedForTableView:(__kindof UITableView *)tableView
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0
    if (@available(ios 11.0, *))
    {
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
    }
#endif
}

#pragma mark - 修改状态栏的颜色
+ (void)statusBarBackgroundColor:(UIColor *)color
{
    if (@available(ios 13.0, *))
    {
        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].keyWindow.windowScene.statusBarManager;

        if([statusBarManager respondsToSelector:@selector(createLocalStatusBar)])
        {

            UIView *localStatusBarView = [statusBarManager performSelector:@selector(createLocalStatusBar)];
            UIView *statusBarView = [localStatusBarView performSelector:@selector(statusBar)];
            
            UIColor *statusBarColor = color;
            [statusBarView performSelector:@selector(setForegroundColor:)withObject:statusBarColor];
        }
    }
    else
    {
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)])
        {
            statusBar.backgroundColor = color;
        }
    }
}

@end


 
