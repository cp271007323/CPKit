//
//  UITextField+Extension.h
//  RouXiAntique_Shop
//
//  Created by RouXiAntique_Shop on 2017/11/15.
//  Copyright © 2017年 xxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

@property (nonatomic , strong) UIColor *placeholdColor;

@property (nonatomic , strong) UIFont *placeholdFont;

//限制内容
+(NSInteger)limitTextField:(UITextField *)textField
                    string:(NSString *)string
                    number:(NSInteger)number;

@end
