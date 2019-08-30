//
//  CPNetManger.m
//  Hotel
//
//  Created by RouXiAntique_Shop on 2017/6/7.
//  Copyright © 2017年 zhu. All rights reserved.
//

#import "CPNetManager.h"
#import "CPKit.h"

@implementation CPNetManager

+(void)networkReachabilityStart
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        switch (status)
        {
            case AFNetworkReachabilityStatusReachableViaWWAN :
            case AFNetworkReachabilityStatusReachableViaWiFi :{
                CPLog(@"wifi");
            }
                break;
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusNotReachable:{
                CPLog(@"unknown");
            }
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];
}

+(NSURLSessionTask * _Nonnull)POST:(NSString * _Nonnull)urlStr
 parameters:(NSDictionary * _Null_unspecified)dictionary
    success:(CPNetRequestSuccess _Nonnull)success
    failure:(CPNetRequestFailure _Null_unspecified)failure
{
    return [[CPNetRequest getManager] CPPOST:urlStr
                                  parameters:dictionary
                                     success:success
                                     failure:failure];
}

+(NSURLSessionTask * _Nonnull)GET:(NSString * _Nonnull)urlStr
                       parameters:(NSDictionary * _Null_unspecified)dictionary
                          success:(CPNetRequestSuccess _Nonnull)success
                          failure:(CPNetRequestFailure _Null_unspecified)failure
{
    return [[CPNetRequest getManager] CPGET:urlStr
                                 parameters:dictionary
                                    success:success
                                    failure:failure];
}

+(NSURLSessionTask * _Nonnull)PUT:(NSString * _Nonnull)urlStr
                       parameters:(NSDictionary * _Null_unspecified)dictionary
                          success:(CPNetRequestSuccess _Nonnull)success
                          failure:(CPNetRequestFailure _Null_unspecified)failure
{
    
    return [[CPNetRequest getManager] CPPUT:urlStr
                                 parameters:dictionary
                                    success:success
                                    failure:failure];
}

+(NSURLSessionTask * _Nonnull)PATCH:(NSString * _Nonnull)urlStr
                         parameters:(NSDictionary * _Null_unspecified)dictionary
                            success:(CPNetRequestSuccess _Nonnull)success
                            failure:(CPNetRequestFailure _Null_unspecified)failure
{
    
    return [[CPNetRequest getManager] CPPATCH:urlStr
                                   parameters:dictionary
                                      success:success
                                      failure:failure];
}

+(NSURLSessionTask * _Nonnull)DEL:(NSString * _Nonnull)urlStr
                       parameters:(NSDictionary * _Null_unspecified)dictionary
                          success:(CPNetRequestSuccess _Nonnull)success
                          failure:(CPNetRequestFailure _Null_unspecified)failure
{
    
    return [[CPNetRequest getManager] CPDEL:urlStr
                                 parameters:dictionary
                                    success:success
                                    failure:failure];
}



+(NSURLSessionTask * _Nonnull)POST:(NSString * _Nonnull)urlStr
                        parameters:(NSDictionary * _Null_unspecified)dictionary
                        dataModels:(NSArray<CPDataModel *> * _Nonnull)dataModels
                          progress:(CPNetRequestDownProgress _Null_unspecified)progress
                           success:(CPNetRequestSuccess _Nonnull)success
                           failure:(CPNetRequestFailure _Null_unspecified)failure
{
    return [[CPNetRequest getManager] CPPOST:urlStr
                                  parameters:dictionary
                                  dataModels:dataModels
                                    progress:progress
                                     success:success
                                     failure:failure];
}

+(NSURLSessionDownloadTask * _Nonnull)downloadUrl:(NSString *_Nonnull)urlStr
                                         progress:(CPNetRequestDownProgress _Null_unspecified)progress
                                      destination:(CPNetRequestDestination _Nonnull)destination
                                completionHandler:(CPNetRequestDownCompletionHandler _Nonnull)completionHandler
{
    return [[CPNetRequest getManager] CPdownloadUrl:urlStr
                                           progress:progress
                                        destination:destination
                                  completionHandler:completionHandler];
}



@end
