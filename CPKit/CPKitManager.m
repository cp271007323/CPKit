//
//  CPKitManager.m
//  CPKit_Test
//
//  Created by 陈平 on 2019/8/29.
//  Copyright © 2019 PSK. All rights reserved.
//

#import "CPKitManager.h"


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
        
    }
    return self;
}


#pragma mark - Get

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
