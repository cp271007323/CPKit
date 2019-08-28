//
//  NSMutableArray+Extension.m
//  XDH
//
//  Created by 陈平 on 2018/8/1.
//  Copyright © 2018年 XDH. All rights reserved.
//

#import "NSMutableArray+Extension.h"

@implementation NSMutableArray (Extension)

+ (NSArray *)exchangeObject:(NSMutableArray *)arrs length:(NSInteger)length
{
    for (int i = 0; i < arrs.count; i++)
    {
        int n = (arc4random() % (arrs.count - i)) + i;
        [arrs exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    return [arrs subarrayWithRange:NSMakeRange(0,length)];
}

+ (NSArray<NSString *> *)sort:(NSArray<NSString *> *)arr
{
    NSSortDescriptor *bookNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"" ascending:YES];
    return [[arr sortedArrayUsingDescriptors:@[bookNameDesc]] mutableCopy];
}


@end
