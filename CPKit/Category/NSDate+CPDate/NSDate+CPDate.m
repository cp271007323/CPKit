//
//  NSDate+CPDate.m
//  CP_Category
//
//  Created by Mac on 17/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "NSDate+CPDate.h"

@implementation NSDate (CPDate)

+(NSString *)currentDateWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
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
