//
//  CPShareController.h
//  ActivityViewController多图分享
//
//  Created by XYQ on 2019/7/12.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPShareController : UIActivityViewController

+ (instancetype)sharaMangerWithTitle:(NSString *)title
                               image:(UIImage *)image
                                 url:(NSString *)url;

+ (instancetype)sharaMangerWithTitle:(NSString *)title
                              images:(NSArray<UIImage *>*)images;

- (void)shareWithViewController:(UIViewController *)viewController view:(UIView *)view;

@end
