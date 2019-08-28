//
//  UIBarButtonItem+Extension.m
//  MeetCarefree
//
//  Created by 陈平 on 2017/11/16.
//  Copyright © 2017年 xxf. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "CPNumberBtn.h"
#import "UIView+CPFrame.h"

@implementation UIBarButtonItem (Extension)

/**
 生成导航按钮
 */
+(instancetype)barButtonTitle:(NSString *)title
                        image:(UIImage *)image
                       button:(void (^)(CPNumberBtn *btn))buttonblock
{
    
    CPNumberBtn *btn = [CPNumberBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn sizeToFit];
    if (btn.CP_Height < 40) {
        btn.CP_Height = 40;
    }
    
    if (btn.CP_Width < 40) {
        btn.CP_Width = 40;
    }
    if (buttonblock) buttonblock(btn);
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return item;
}

@end

