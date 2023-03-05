//
//  NSDate+CPDate.h
//  CP_Category
//
//  Created by Mac on 17/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CPDate)

/** 时间装换指定类型 */
+(NSString *)currentDateWithFormat:(NSString *)format;

/** 当前时间 YYYY-MM-dd hh:mm:ss */
+(NSString *)currentDate;

/** 当前时间戳 */
+(NSString *)currentTimeStamp;

/** 当前时间戳（秒） */
+(NSString *)currentTimeStampForInter;


@end
