//
//  CPUserDefaultTool.h
//  Mac
//
//  Created by Mac on 2019/7/11.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPUserDefaultTool : NSObject

/**
 获取单例对象
 */
+(instancetype)shareUserDefault;

/**
 写入用户数据
 */
+ (void)setUserInfo:(NSDictionary *)userInfo;

/**
 获取用户数据
 */
+ (NSDictionary *)getUserInfo;

/**
 移除用户数据
 */
+ (void)removeUserInfo;

/**
 清除所有缓存数据
 */
+(void)removeAllCacheData;

/**
 添加数据到沙盒
 */
- (void)addDataToSandBox:(id)object key:(NSString *)key;

/**
 从沙盒获取数据
 */
- (id)dataFromSandBox:(NSString *)key;

/**
 从沙盒中移除数据
 */
- (void)removeDataFromSandBox:(NSString *)key;


@end
