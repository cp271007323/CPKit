//
//  UIBarButtonItem+Extension.h
//  MeetCarefree
//
//  Created by 陈平 on 2017/11/16.
//  Copyright © 2017年 xxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPNumberBtn;

@interface UIBarButtonItem (Extension)

/**
 生成导航按钮
 */
+(instancetype)barButtonTitle:(NSString *)title
                        image:(UIImage *)image
                       button:(void (^)(CPNumberBtn *btn))buttonblock;

@end
