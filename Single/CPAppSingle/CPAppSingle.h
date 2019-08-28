//
//  CPAppSingle.h
//  Antique_Shop
//
//  Created by 陈平 on 2019/8/22.
//  Copyright © 2019 RuoXi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CPAppSingle : NSObject

/**
 导航栏高度
 */
@property (nonatomic , assign , readonly) CGFloat navHeight;

/**
 状态栏高度
 */
@property (nonatomic , assign , readonly) CGFloat statusBarHeight;

/**
 标签栏高度
 */
@property (nonatomic , assign ) CGFloat tabBarHeight;

/**
 初始化
 */
+(instancetype)shareManager;


@end

NS_ASSUME_NONNULL_END
