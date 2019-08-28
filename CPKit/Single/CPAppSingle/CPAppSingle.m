//
//  CPAppSingle.m
//  Antique_Shop
//
//  Created by 陈平 on 2019/8/22.
//  Copyright © 2019 RuoXi. All rights reserved.
//

#import "CPAppSingle.h"


@interface CPAppSingle ()



@end


@implementation CPAppSingle

#pragma mark - 生命周期
static CPAppSingle *instance = nil;

+(instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil)
        {
            instance = [[CPAppSingle alloc] init];
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

#pragma mark - Private Method
- (void)setupBingdingForSingle
{
    
}

#pragma mark - Public Method



#pragma mark - get

- (CGFloat) navHeight
{
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    return  (int)statusBarHeight == 44 ? 88 : 64;
}

- (CGFloat)statusBarHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

- (CGFloat)tabBarHeight
{
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    return  (int)statusBarHeight == 44 ? 88 : 49;
}
@end
