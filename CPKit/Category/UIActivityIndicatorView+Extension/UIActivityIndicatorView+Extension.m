//
//  UIActivityIndicatorView+Extension.m
//  MeetAll
//
//  Created by 陈平 on 2018/3/2.
//  Copyright © 2018年 XXF. All rights reserved.
//

#import "UIActivityIndicatorView+Extension.h"
#import <objc/message.h>

@implementation UIActivityIndicatorView (Extension)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method old_method1 = class_getInstanceMethod(self, @selector(startAnimating));
        Method new_method1 = class_getInstanceMethod(self, @selector(cp_startAnimating));
        method_exchangeImplementations(old_method1, new_method1);
        
        Method old_method2 = class_getInstanceMethod(self, @selector(stopAnimating));
        Method new_method2 = class_getInstanceMethod(self, @selector(cp_stopAnimating));
        method_exchangeImplementations(old_method2, new_method2);
        
    });
    
}

- (void)setAnimated:(BOOL)animated{
    objc_setAssociatedObject(self, @selector(animated), @(animated), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)animated{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)cp_startAnimating{
    [self cp_startAnimating];
    self.animated = YES;
}

- (void)cp_stopAnimating{
    [self cp_stopAnimating];
    self.animated = NO;
}

@end
