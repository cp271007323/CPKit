//
//  CPFileTool.h
//  CP_Category
//
//  Created by Mac on 17/5/18.
//  Copyright © 2017年 Mac. All rights reserved.

//  处理文件缓存

#import <Foundation/Foundation.h>

//缓存路径
#define CPCachePath             [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

//沙盒文档路径
#define CPDocumentPath          [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

typedef enum : NSUInteger {
    CPCacheSize_G,
    CPCacheSize_M,
    CPCacheSize_KB,
    CPCacheSize_B,
} CPCache_SizeType;

@interface CPFileTool : NSObject

/**
 获取路径文件大小

 @param directoryPath 路劲
 @return 返回路径文件大小
 */
+(NSUInteger)getDirectorySizeWithPath:(NSString *)directoryPath;

/**
 获取路径文件大小字符串

 @param directoryPath 路径
 @param cacheSizeType 路径大小格式
 @return 返回路径格式后的大小字符串
 */
+(NSString *)getDirectorySizeWithPath:(NSString *)directoryPath sizeType:(CPCache_SizeType)cacheSizeType;

/**
 获取路径文件大小字符串 默认 B
 
 @param directoryPath 路径
 @return 返回路径格式后的大小字符串
 */
+(NSString *)getDirectorySizeStrWithPath:(NSString *)directoryPath;

/**
 清除路径下的文件

 @param directoryPath 路径
 */
+(void)removeDirectoryPath:(NSString *)directoryPath;

@end
