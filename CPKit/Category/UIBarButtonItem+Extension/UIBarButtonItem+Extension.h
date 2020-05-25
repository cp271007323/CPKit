//
//  UIBarButtonItem+Extension.h
//  Mac
//
//  Created by Mac on 2017/11/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPNumberBtn.h"

@interface UIBarButtonItem (Extension)

/**
 生成导航按钮
 */
+(instancetype)barButtonTitle:(NSString *)title
                        image:(UIImage *)image
                       button:(void (^)(CPNumberBtn *btn))buttonblock;

@end
