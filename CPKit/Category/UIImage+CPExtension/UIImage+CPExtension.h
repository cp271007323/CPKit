//
//  UIImage+CPExtension.h
//  Hotel
//
//  Created by lk03 on 2017/7/18.
//  Copyright © 2017年 zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CPExtension)

/**
 裁圆
 */
- (instancetype)circleImage;

/**
 去除边缘锯齿
 */
- (UIImage *)antiAlias;

@end
