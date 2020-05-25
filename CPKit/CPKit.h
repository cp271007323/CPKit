//
//  CPKit.h
//  CPKit_Test
//
//  Created by Mac on 2019/8/29.
//  Copyright © 2019 Mac. All rights reserved.
//

#ifndef CPKit_h
#define CPKit_h

//输出
#if DEBUG

#define CPLog(...) \
printf("[%s  第%d行]: %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#else
#define CPLog(...)
#endif

//版本
#define CPiOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define CPiOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define CPiOS10Later ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)
#define CPiOS11Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)


#import <SDAutoLayout/SDAutoLayout.h>
#import <MJRefresh/MJRefresh.h>
#import <YYKit/YYKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <UIKit/UIKit.h>
#import "CPKitManager.h"
#import "CPAlertController.h"
#import "BaseViewController.h"
#import "BaseTableViewTextFieldCell.h"
#import "BaseTableViewCell.h"
#import "BaseTableViewButtonCell.h"
#import "BaseCollectionViewCell.h"
#import "BaseCollectionReusableView.h"
#import "BaseTableViewHeaderFooterView.h"
#import "UIView+CPFrame.h"
#import "UIViewController+CP_Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "NSMutableAttributedString+Extension.h"
#import "UIImage+Extension.h"
#import "UITextField+Extension.h"
#import "UITableView+Extension.h"
#import "UICollectionView+Extension.h"
#import "NSString+Extension.h"
#import "UITabBarController+Extension.h"
#import "NSDate+CPDate.h"
#import "CPFileTool.h"
#import "CPFootRefresh.h"
#import "CPHeadGifRefresh.h"
#import "CPShareController.h"
#import "CPUserDefaultTool.h"
#import "CPCoverView.h"
#import "CPRoundLab.h"
#import "CPLayoutBtn.h"


//引用
#define kWeakObject(x)          @weakify(x);
#define kStrongObject(x)        @strongify(x);

//当前版本号
#define CPAPP_Version   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define CPFileManager           [NSFileManager defaultManager]
#define CPNotificationCenter    [NSNotificationCenter defaultCenter]
#define CPUserDefaults          [NSUserDefaults standardUserDefaults]
#define CPUUID                  [UIDevice currentDevice].identifierForVendor.UUIDString
#define CPWindow                [UIApplication sharedApplication].delegate.window

//ipad
#define isIPad                  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

//清除空值
UIKIT_STATIC_INLINE NSString * CPString(NSString *str)
{
    return [NSString stringWithFormat:@"%@",str];
}

//整型转字符串
UIKIT_STATIC_INLINE NSString * CPIString(NSInteger f)
{
    return [NSString stringWithFormat:@"%ld",(long)f];
}

//浮点转字符串
UIKIT_STATIC_INLINE NSString * CPFString(CGFloat f)
{
    return [NSString stringWithFormat:@"%.2lf",f];
}

//浮点转字符串
UIKIT_STATIC_INLINE NSString * CPLFString(CGFloat f)
{
    return [NSString stringWithFormat:@"%lf",f];
}

//转NSURL
UIKIT_STATIC_INLINE NSURL * CPUrl(NSString *str)
{
    return [NSURL URLWithString:CPString(str)];
}

//默认头像
UIKIT_STATIC_INLINE UIImage * CPDefImage()
{
    return [UIImage imageNamed:@"defHead"];
}

//获取屏幕宽度
UIKIT_STATIC_INLINE CGFloat CPScreenWidth()
{
    return [UIScreen mainScreen].bounds.size.width;
}

//获取屏幕高度
UIKIT_STATIC_INLINE CGFloat CPScreenHeight()
{
    return [UIScreen mainScreen].bounds.size.height;
}

//随机色
UIKIT_STATIC_INLINE UIColor * CPRandomColor()
{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}

//颜色
UIKIT_STATIC_INLINE UIColor * CPColor(NSString *colroStr)
{
    NSString *cString = [[colroStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

//获取图片
UIKIT_STATIC_INLINE UIImage * CPImageName(NSString * imageName)
{
    return [UIImage imageNamed:imageName];
}

//宽度适配
UIKIT_STATIC_INLINE CGFloat CPAuto(CGFloat width)
{
    if (CPScreenWidth() > 600)
    {
        return ((width / 375.0) * 415.0);
    }else{
        return ((width / 375.0) * CPScreenWidth());
    }
}

//适配文字Font
UIKIT_STATIC_INLINE NSUInteger adaptSize(NSUInteger fontSize)
{
    return CPAuto(fontSize);
}

//平方细体Font适配
UIKIT_STATIC_INLINE UIFont * CPFont_Light(NSUInteger fontSize)
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Light" size:adaptSize(fontSize)];
    if (!font)
    {
        font = [UIFont systemFontOfSize:fontSize weight:0.5];
    }
    return font;
}


//中粗体Font适配
UIKIT_STATIC_INLINE UIFont * CPFont_Semibold(NSUInteger fontSize)
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Semibold" size:adaptSize(fontSize)];
    if (!font)
    {
        font = [UIFont systemFontOfSize:fontSize weight:2];
    }
    return font;
}

//常规体Font适配
UIKIT_STATIC_INLINE UIFont * CPFont_Regular(NSUInteger fontSize)
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:adaptSize(fontSize)];
    if (!font)
    {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

//中黑体Font适配
UIKIT_STATIC_INLINE UIFont * CPFont_Medium(NSUInteger fontSize)
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:adaptSize(fontSize)];
    if (!font)
    {
        font = [UIFont boldSystemFontOfSize:fontSize];
    }
    return font;
}

//中黑体Font适配
UIKIT_STATIC_INLINE UIFont * CPFont_Bold(NSUInteger fontSize)
{
    UIFont *font = [UIFont fontWithName:@"PingFang-SC-Bold" size:adaptSize(fontSize)];
    if (!font)
    {
        font = [UIFont boldSystemFontOfSize:fontSize];
    }
    return font;
}

//画圆角
UIKIT_STATIC_INLINE CAShapeLayer * shaperOLayer(CGFloat width , CGFloat height)
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(1, 1, width-2, height - 2) cornerRadius:(height - 2) * 0.5];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    return layer;
}

UIKIT_STATIC_INLINE UIColor *CPLineColor()
{
    return CPColor(@"eeeeee");
}

#endif /* CPKit_h */
