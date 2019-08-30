//
//  CPShareModel.m
//  SSZS
//
//  Created by XYQ on 2019/7/12.
//  Copyright © 2018年 XYQ. All rights reserved.
//

#import "CPShareModel.h"

@interface CPShareModel ()<
UIActivityItemSource>

@property (nonatomic , strong) UIImage *image;

@property (nonatomic , strong) NSURL *filePath;

@end

@implementation CPShareModel

#pragma mark - Life
- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        if (image)
        {
            self.image = image;
            NSString *docPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
            //图片缓存的地址，自己进行替换
            NSString *imagePath = [docPath stringByAppendingString:[NSString stringWithFormat:@"cp_share_%lld.jpg",[[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970]*1000]];
            //把图片写进缓存，一定要先写入本地，不然会分享出错
            [UIImageJPEGRepresentation(image, 1) writeToFile:imagePath atomically:YES];
            //把缓存图片的地址转成NSUrl格式
            self.filePath = [NSURL fileURLWithPath:imagePath];
        }
    }
    return self;
}
 
#pragma mark - UIActivityItemSource
- (id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController
{
    return self.image;
}

- (nullable id)activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(nullable UIActivityType)activityType
{
    NSLog(@"2222222:%@",activityType);
    if ([activityType isEqualToString:@"com.tencent.mqq.ShareExtension"])
    {
        return self.image;
    }
    else
    {
        return self.filePath;
    }
}



#pragma mark - Get

@end

