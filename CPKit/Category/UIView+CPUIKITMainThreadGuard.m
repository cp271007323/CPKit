//
//  UIView+CPUIKITMainThreadGuard.m
//  Hotel
//
//  Created by lk03 on 2017/7/4.
//  Copyright © 2017年 zhu. All rights reserved.
//

#import "UIView+CPUIKITMainThreadGuard.h"
#import <objc/runtime.h>

static inline void swizzling_exchangeMethod(Class clazz ,SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(clazz, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(clazz, swizzledSelector);
    
    BOOL success = class_addMethod(clazz, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success)
        {
        class_replaceMethod(clazz, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UIView (CPUIKITMainThreadGuard)
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL needsLayoutOriginalSelector = @selector(setNeedsLayout);
        SEL needsLayoutSwizzleSelector  = @selector(guard_setNeedsLayout);
        swizzling_exchangeMethod(self, needsLayoutOriginalSelector,needsLayoutSwizzleSelector);
        
        SEL needsDisplaOriginalSelector = @selector(setNeedsDisplay);
        SEL needsDisplaSwizzleSelector  = @selector(guard_setNeedsDisplay);
        swizzling_exchangeMethod(self, needsDisplaOriginalSelector,needsDisplaSwizzleSelector);
        
        SEL needsDisplayInRectOriginalSelector = @selector(setNeedsDisplayInRect:);
        SEL needsDisplayInRectSwizzleSelector  = @selector(guard_setNeedsDisplayInRect:);
        swizzling_exchangeMethod(self, needsDisplayInRectOriginalSelector,needsDisplayInRectSwizzleSelector);
        
    });
}

- (void)guard_setNeedsLayout
{
    [self UIMainThreadCheck];
    [self guard_setNeedsLayout];
}

- (void)guard_setNeedsDisplay
{
    [self UIMainThreadCheck];
    [self guard_setNeedsDisplay];
}


- (void)guard_setNeedsDisplayInRect:(CGRect)rect
{
    [self UIMainThreadCheck];
    [self guard_setNeedsDisplayInRect:rect];
}

- (void)UIMainThreadCheck
{
    NSString *desc = [NSString stringWithFormat:@"%@", self.class];
//    CPLog(@"%@",desc);
    //崩在这说明有个UI没有放在主线程中
    NSAssert([NSThread isMainThread], desc);
    
}
@end
