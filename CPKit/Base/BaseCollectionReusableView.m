//
//  BaseCollectionReusableView.m
//  SSZS
//
//  Created by Mac on 2018/9/1.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "BaseCollectionReusableView.h"

@implementation BaseCollectionReusableView
 
#pragma mark - Public
+ (NSString *)identifier
{
    return NSStringFromClass(self);
}

@end
