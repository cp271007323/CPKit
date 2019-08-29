//
//  UIImage+CPExtension.m
//  Hotel
//
//  Created by lk03 on 2017/7/18.
//  Copyright © 2017年 zhu. All rights reserved.
//

#import "UIImage+CPExtension.h"
#import <ImageIO/ImageIO.h>

@implementation UIImage (CPExtension)

- (instancetype)circleImage{
    CGFloat radius = self.size.width > self.size.height ? self.size.height * .5 : self.size.width * .5;
    CGRect rect = CGRectMake(0, 0, radius * 2, radius * 2);
    CGRect drawRect = CGRectMake(-1 * (self.size.width * .5 - radius), 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [[UIColor redColor] setFill];
    [path fill];
    [path addClip];
    [self drawInRect:drawRect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image antiAlias];
}

- (UIImage *)antiAlias
{
    CGFloat border = 1.0f;
    CGRect rect = CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border);
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}

@end
