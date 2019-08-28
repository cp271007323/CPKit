//
//  NSMutableArray+Extension.h
//  XDH
//
//  Created by 陈平 on 2018/8/1.
//  Copyright © 2018年 XDH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Extension)

/**
 随机交换后、提取前几位
 */
+ (NSArray *)exchangeObject:(NSMutableArray *)arrs length:(NSInteger)length;

/**
 排序
 */
+ (NSArray<NSString *> *)sort:(NSArray<NSString *> *)arr;

@end
