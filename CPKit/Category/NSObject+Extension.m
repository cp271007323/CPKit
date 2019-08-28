//
//  NSObject+Extension.m
//  MeetCarefree
//
//  Created by 陈平 on 2017/11/8.
//  Copyright © 2017年 xxf. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/message.h>

@implementation NSObject (Extension)

// 返回self的所有对象名称
+ (NSArray<NSString *> *)propertyOfSelf{
    unsigned int count;
    
    // 1. 获得类中的所有成员变量
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    NSMutableArray<NSString *> *properNames =[NSMutableArray array];
    for (int i = 0; i < count; i++)
        {
        Ivar ivar = ivarList[i];
        
        // 2.获得成员属性名
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 3.除去下划线，从第一个角标开始截取
        NSString *key = [name substringFromIndex:1];
        
        [properNames addObject:key];
    }
    
    return [properNames copy];
}


@end
