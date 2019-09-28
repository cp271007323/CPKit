//
//  UIBarButtonItem+Extension.h
//  RouXiAntique_Shop
//
//  Created by RouXiAntique_Shop on 2017/11/16.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 生成导航按钮
 */
+(instancetype)barButtonTitle:(NSString *)title
                        image:(UIImage *)image
                       button:(void (^)(UIButton *btn))buttonblock;

@end
