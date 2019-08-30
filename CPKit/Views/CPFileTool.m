//
//  CPFileTool.m
//  CP_Category
//
//  Created by RouXiAntique_Shop on 17/5/18.
//  Copyright © 2017年 KKJY. All rights reserved.
//

#import "CPFileTool.h"

@implementation CPFileTool

static dispatch_queue_t queue;

+(void)load
{
    queue = dispatch_queue_create("(NSFileManager+CPCache.h)_queue", DISPATCH_QUEUE_SERIAL);
}

+(NSUInteger)getDirectorySizeWithPath:(NSString *)directoryPath
{
    [self directoryExistsAtPath:directoryPath name:@"路径错误" reason:@"传入的参数应该是文件夹路径，并且是存在的。"];
    __block NSUInteger size = 0;
    dispatch_sync(queue, ^{
        NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:directoryPath];
        for (NSString *fileName in fileEnumerator)
        {
            NSString *filePath = [directoryPath stringByAppendingPathComponent:fileName];
            NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
            size += [attrs fileSize];
        }
    });
    return size;
}

+(NSString *)getDirectorySizeWithPath:(NSString *)directoryPath sizeType:(CPCache_SizeType)cacheSizeType
{
    NSUInteger size = [self getDirectorySizeWithPath:directoryPath];
    
    NSString *sizeStr;
    switch (cacheSizeType)
        {
        case CPCacheSize_G:{
            sizeStr = [NSString stringWithFormat:@"%.2lfG",size / 1000.0 / 1000.0 / 1000.0];
        } break;
        case CPCacheSize_M:{
            sizeStr = [NSString stringWithFormat:@"%.2lfM",size / 1000.0 / 1000.0];
        } break;
        case CPCacheSize_KB:{
            sizeStr = [NSString stringWithFormat:@"%.2lfKB",size / 1000.0 ];
        } break;
        case CPCacheSize_B:{
            sizeStr = [NSString stringWithFormat:@"%ldB",(unsigned long)size];
        } break;
        default:{
            sizeStr = @"0B";
        } break;
    }
    return sizeStr;
}

+(NSString *)getDirectorySizeStrWithPath:(NSString *)directoryPath
{
    NSUInteger size = [self getDirectorySizeWithPath:directoryPath];
    
    NSString *sizeStr = [NSString stringWithFormat:@"%ldB",(unsigned long)size];
    
    if (size > 1000.0)
        {
        sizeStr = [NSString stringWithFormat:@"%.2lfKB",size / 1000.0];
    }
    if (size > 1000.0 * 1000.0)
        {
        sizeStr = [NSString stringWithFormat:@"%.2lfM",size / 1000.0 / 1000.0];
    }
    if (size > 1000.0 * 1000.0 * 1000.0)
        {
        sizeStr = [NSString stringWithFormat:@"%.2lfG",size / 1000.0 / 1000.0 / 1000.0];
    }
    
    return sizeStr;
}

+(void)removeDirectoryPath:(NSString *)directoryPath
{
    [self directoryExistsAtPath:directoryPath name:@"路径错误" reason:@"传入的参数应该是文件夹路径，并且是存在的。"];
    dispatch_sync(queue, ^{
        NSArray<NSString *> *subPaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] error:nil];
        for (NSString *subPath in subPaths)
        {
            NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:subPath];
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        }
    });
}

//判断是否为存在的文件夹，不存在或非文件夹就抛出异常
+(void)directoryExistsAtPath:(NSString *)directoryPath
                        name:(NSString *)name
                      reason:(NSString *)reason
{
    BOOL isDirectory;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!isExist || !isDirectory)
        {
        NSException *exception = [NSException exceptionWithName:name reason:reason userInfo:nil];
        [exception raise];
    }
}


@end
