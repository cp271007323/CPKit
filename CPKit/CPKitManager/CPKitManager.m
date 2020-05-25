//
//  CPKitManager.m
//  CPKit_Test
//
//  Created by Mac on 2019/8/29.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "CPKitManager.h"
#import "CPUserDefaultTool.h"
#import "CPKit.h"

@interface CPKitManager ()



@end


@implementation CPKitManager

static CPKitManager *instance = nil;

+(instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil)
        {
            instance = [[CPKitManager alloc] init];
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

#pragma mark - Life
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSDictionary *dic = [CPUserDefaultTool getUserInfo];
        if (dic)
        {
            CPLog(@">>>>>>>>>>>>>>>>>>>>>:用户数据存在")
            self.userModel = [NSClassFromString(dic[@"Class"]) modelWithDictionary:dic];
        }
        else
        {
            CPLog(@">>>>>>>>>>>>>>>>>>>>>:用户数据不存在")
        }
        
        kWeakObject(self)
        [RACObserve(self, userModel) subscribeNext:^(id  _Nullable x){
            kStrongObject(self)
            //存在用户
            if (x)
            {
                [CPUserDefaultTool setUserInfo:[self.userModel modelToJSONObject]];
            }
            //不存在
            else
            {
                //移除用户数据
                [CPUserDefaultTool removeUserInfo];
            }
        }];
        
    }
    return self;
}


#pragma mark - Get
- (BOOL)isLogin
{
    return self.userModel ? YES : NO;
}

- (CGFloat)systemNavgationBarHeight
{
    if (![UIApplication sharedApplication].isStatusBarHidden)
    {
        return (int)self.systemStatusBarHeight == 44 ? 88 : 64;
    }
    else
    {
        return (int)self.systemStatusBarHeight == 44 ? 88 - self.systemStatusBarHeight : 64 - self.systemStatusBarHeight;
    }
}

- (CGFloat)systemStatusBarHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

- (CGFloat)systemTabBarHeight
{
    return  (int)self.systemStatusBarHeight == 44 ? 88 : 49;
}

- (UIWindow *)systemWindow
{
    return [UIApplication sharedApplication].delegate.window;
}

@end
