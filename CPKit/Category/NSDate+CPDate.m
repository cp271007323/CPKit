//
//  NSDate+CPDate.m
//  CP_Category
//
//  Created by lk03 on 17/5/18.
//  Copyright © 2017年 KKJY. All rights reserved.
//

#import "NSDate+CPDate.h"

@implementation NSDate (CPDate)

+(NSString *)currentDateForYYYY_MM_DD_hh_mm_ss
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    return [formatter stringFromDate:[NSDate date]];
}

+(NSString *)currentDateForYYYY_MM_DD_hh_mm
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm"];
    return [formatter stringFromDate:[NSDate date]];
}

+(NSString *)currentDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    return [formatter stringFromDate:[NSDate date]];
}

+(NSString *)currentTimeStamp{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [dat timeIntervalSince1970]*1000;
    return [NSString stringWithFormat:@"%lld", (long long)a];
}

+(NSString *)currentTimeStampForInter{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [dat timeIntervalSince1970];
    return [NSString stringWithFormat:@"%lld", (long long)a];
}

@end
