//
//  CPKitManager.h
//  CPKit_Test
//
//  Created by 陈平 on 2019/8/29.
//  Copyright © 2019 PSK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CPKitManager : NSObject

+(instancetype)shareManager;


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


@end

NS_ASSUME_NONNULL_END
