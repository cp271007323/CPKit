//
//  CPUserDefaultTool.m
//  Mac
//
//  Created by Mac on 2019/7/11.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CPUserDefaultTool.h"

static NSString *KUserInfo_Key = @"KUserInfo_Key";


@interface CPUserDefaultTool ()

@end

@implementation CPUserDefaultTool

#pragma mark - Life

static CPUserDefaultTool *instance = nil;

+(instancetype)shareUserDefault{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil)
        {
            instance = [[CPUserDefaultTool alloc] init];
        }
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil)
        {
            instance = [super allocWithZone:zone];
        }
    });
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self)
        {
        
    }
    return self;
}


#pragma mark - Public
//写入用户数据
+ (void)setUserInfo:(NSDictionary *)userInfo{
    [[self shareUserDefault] addDataToSandBox:userInfo key:KUserInfo_Key];
}

//获取用户数据
+ (NSDictionary *)getUserInfo{
    return [[self shareUserDefault] dataFromSandBox:KUserInfo_Key];
}

/**
 移除用户数据
 */
+ (void)removeUserInfo
{
    [[self shareUserDefault] removeDataFromSandBox:KUserInfo_Key];
}

//清除所有缓存数据
+(void)removeAllCacheData
{
    
}

//添加到沙盒
- (void)addDataToSandBox:(id)object key:(NSString *)key{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (self)
        {
            [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    });
}

//获取沙盒数据
- (id)dataFromSandBox:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

//从沙盒里移除
- (void)removeDataFromSandBox:(NSString *)key{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (self)
        {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    });
}

@end
