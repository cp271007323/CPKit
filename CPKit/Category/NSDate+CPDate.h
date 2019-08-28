//
//  NSDate+CPDate.h
//  CP_Category
//
//  Created by lk03 on 17/5/18.
//  Copyright © 2017年 KKJY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CPDate)

/**
 当前时间
 */
+(NSString *)currentDate;

/**
 当前时间戳
 */
+(NSString *)currentTimeStamp;


/**
 当前时间戳（秒）
 */
+(NSString *)currentTimeStampForInter;


@end
