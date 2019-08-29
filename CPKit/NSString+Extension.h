//
//  NSString+StringRegular.h
//  MeetCarefree
//
//  Created by 陈平 on 2017/11/6.
//  Copyright © 2017年 林敏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 md5
 */
- (NSString *)md5;

/**
 秒转时间
 */
+ (NSString *)timeForRemaining:(NSInteger)sec;

/**
 移除省字
 */
- (NSString *)removeProvinceChar;

/**
 //传入 秒  得到 DD:HH:MM:SS
 */
- (NSString *)getDDHHMMSSFromSS;

/**
 //传入 秒  得到 HH:MM:SS
 */
- (NSString *)getHHMMSSFromSS;

@end
