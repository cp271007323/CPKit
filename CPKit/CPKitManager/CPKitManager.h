//
//  CPKitManager.h
//  CPKit_Test
//
//  Created by Mac on 2019/8/29.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CPKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface CPKitManager : NSObject

+(instancetype)shareManager;

/**
 用户数据类型
 */
@property (nonatomic , strong) id userModel;

/**
 系统导航栏高度
 */
@property (nonatomic , assign , readonly) CGFloat systemNavgationBarHeight;

/**
 状态栏高度
 */
@property (nonatomic , assign , readonly) CGFloat systemStatusBarHeight;

/**
 标签栏高度
 */
@property (nonatomic , assign , readonly) CGFloat systemTabBarHeight;

/**
 当前根窗口
 */
@property (nonatomic , strong , readonly) UIWindow *systemWindow;

/**
 是否登录
 */
@property (nonatomic , assign , readonly) BOOL isLogin;

@end

NS_ASSUME_NONNULL_END
