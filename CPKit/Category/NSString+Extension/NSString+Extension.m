//
//  NSString+StringRegular.m
//  Mac
//
//  Created by Mac on 2017/11/6.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

//判断中英混合的的字符串长度
- (NSInteger)charCount
{
    NSInteger number = 0;
    for (NSInteger i = 0; i < self.length; i++) {
        
        unichar p = [self characterAtIndex:i];
        //文字
        if (p >= 0x4E00) {
            
            number += 1;
        }
        //其他
        else {
            
            number += 1;
        }
    }
    return number;
}

@end
