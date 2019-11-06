//
//  UINavigationBar+CP_Extension.m
//  CPNavItem
//
//  Created by chenp on 2019/7/13.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import "UIViewController+CP_Extension.h"
#import <objc/message.h>
#import "UIView+CPFrame.h"
#import "CPKit.h"

@implementation UIBarButtonItem (CP_Extension)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method old_method1 = class_getInstanceMethod(self, @selector(initWithBarButtonSystemItem:target:action:));
        Method new_method1 = class_getInstanceMethod(self, @selector(cp_initWithBarButtonSystemItem:target:action:));
        method_exchangeImplementations(old_method1, new_method1);
        
        
    });
}

- (instancetype)cp_initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem target:(nullable id)target action:(nullable SEL)action{
    self.systemItem = systemItem;
    return [self cp_initWithBarButtonSystemItem:systemItem target:target action:action];
}


- (void)setSystemItem:(UIBarButtonSystemItem)systemItem{
    objc_setAssociatedObject(self, @selector(systemItem), @(systemItem), OBJC_ASSOCIATION_RETAIN);
}

- (UIBarButtonSystemItem)systemItem{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

@end


@implementation UIViewController (CP_Extension)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method old_method1 = class_getInstanceMethod(self, @selector(viewDidAppear:));
        Method new_method1 = class_getInstanceMethod(self, @selector(cp_viewDidAppear:));
        method_exchangeImplementations(old_method1, new_method1);
        
        Method old_method2 = class_getInstanceMethod(self, @selector(viewWillLayoutSubviews));
        Method new_method2 = class_getInstanceMethod(self, @selector(cp_viewWillLayoutSubviews));
        method_exchangeImplementations(old_method2, new_method2);
        
        Method old_method3 = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method new_method3 = class_getInstanceMethod(self, @selector(cp_viewWillAppear:));
        method_exchangeImplementations(old_method3, new_method3);
        
        Method old_method4 = class_getInstanceMethod(self, @selector(viewDidLayoutSubviews));
        Method new_method4 = class_getInstanceMethod(self, @selector(cp_viewDidLayoutSubviews));
        method_exchangeImplementations(old_method4, new_method4);
        
    });
    
}

- (void)cp_viewWillLayoutSubviews{
    [self cp_viewWillLayoutSubviews];
    [self leftItemSpacing:self.cp_leftNavItemSpacing];
    [self rightItemSpacing:self.cp_rightNavItemSpacing];
}

- (void)cp_viewDidLayoutSubviews{
    [self cp_viewDidLayoutSubviews];
    [self leftItemSpacing:self.cp_leftNavItemSpacing];
    [self rightItemSpacing:self.cp_rightNavItemSpacing];
}

- (void)cp_viewDidAppear:(BOOL)animated{
    [self cp_viewDidAppear:animated];
    [self leftItemSpacing:self.cp_leftNavItemSpacing];
    [self rightItemSpacing:self.cp_rightNavItemSpacing];
}

- (void)cp_viewWillAppear:(BOOL)animated{
    [self cp_viewWillAppear:animated];
    [self leftItemSpacing:self.cp_leftNavItemSpacing];
    [self rightItemSpacing:self.cp_rightNavItemSpacing];
}

- (void)setCp_leftNavItemSpacing:(CGFloat)cp_leftNavItemSpacing{
    objc_setAssociatedObject(self, @selector(cp_leftNavItemSpacing), @(cp_leftNavItemSpacing), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)cp_leftNavItemSpacing{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setCp_rightNavItemSpacing:(CGFloat)cp_rightNavItemSpacing{
    objc_setAssociatedObject(self, @selector(cp_rightNavItemSpacing), @(cp_rightNavItemSpacing), OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)cp_rightNavItemSpacing{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)leftItemSpacing:(CGFloat)spacing{
    //系统大于11.0
    if ([[UIDevice currentDevice].systemVersion floatValue] > 11.0)
    {
        for (UIView *view in self.navigationController.navigationBar.subviews)
        {
            if ([view isMemberOfClass:NSClassFromString(@"_UINavigationBarContentView")])
            {
                if (view.subviews.count >= 1 && self.navigationItem.leftBarButtonItems.count != 0)
                {
                    UIView *leftStaticView = view.subviews[0];
                    for (NSLayoutConstraint *constraint in view.constraints)
                    {
                        if (([constraint.firstItem isKindOfClass:UILayoutGuide.class] &&
                             constraint.firstAttribute == NSLayoutAttributeTrailing))
                        {
                            [view removeConstraint:constraint];
                        }
                    }
                    [view addConstraint:[NSLayoutConstraint constraintWithItem:leftStaticView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:spacing]];
                    return;
                }
            }
        }
    }
    //系统11.0之前
    else{
        if (self.navigationItem.leftBarButtonItems.firstObject.systemItem != UIBarButtonSystemItemFixedSpace &&
            self.navigationItem.leftBarButtonItems.count != 0)
        {
            UIBarButtonItem *spacingItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            spacingItem.width = spacing - 16;
            NSMutableArray<UIBarButtonItem *> *arrs = [self.navigationItem.leftBarButtonItems mutableCopy];
            [arrs insertObject:spacingItem atIndex:0];
            self.navigationItem.leftBarButtonItems = arrs;
        }
    }
}

- (void)rightItemSpacing:(CGFloat)spacing{
    //系统大于11.0
    if ([[UIDevice currentDevice].systemVersion floatValue] > 11.0)
    {
        for (UIView *view in self.navigationController.navigationBar.subviews)
        {
            if ([view isMemberOfClass:NSClassFromString(@"_UINavigationBarContentView")])
            {
                if (view.subviews.count >= 1 && self.navigationItem.rightBarButtonItems.count != 0)
                {
                    NSInteger index=  self.navigationItem.leftBarButtonItems.count == 0 ? 0 : 1;
                    UIView *rightStaticView = view.subviews[index];
                    for (NSLayoutConstraint *constraint in view.constraints)
                    {
                        if (([constraint.firstItem isKindOfClass:UILayoutGuide.class] &&
                             constraint.firstAttribute == NSLayoutAttributeTrailing))
                        {
                            [view removeConstraint:constraint];
                        }
                    }
                    [view addConstraint:[NSLayoutConstraint constraintWithItem:rightStaticView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1.0 constant:spacing * -1]];
                    return;
                }
            }
        }
    }
    //系统11.0之前
    else{
        if (self.navigationItem.rightBarButtonItems.firstObject.systemItem != UIBarButtonSystemItemFixedSpace &&
            self.navigationItem.rightBarButtonItems.count != 0)
        {
            UIBarButtonItem *spacingItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            spacingItem.width = spacing - 16;
            NSMutableArray<UIBarButtonItem *> *arrs = [self.navigationItem.rightBarButtonItems mutableCopy];
            [arrs insertObject:spacingItem atIndex:0];
            self.navigationItem.rightBarButtonItems = arrs;
        }
    }
}


- (void)cpLeft_x:(CGFloat)x view:(UIView *)view{
    CGRect rect = view.frame;
    rect.origin.x -= x;
    view.frame = rect;
}


- (void)takePhotoForCamera
{
    [self takePhotoForCameraWithEditing:NO];
}

- (void)takePhotoForCameraWithEditing:(BOOL)edit
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.videoQuality = UIImagePickerControllerQualityTypeHigh;
        imagePicker.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        imagePicker.allowsEditing = edit;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else
    {
        [CPAlertController alertControllerWithTitle:nil message:@"该设备暂不支持拍照" preferredStyle:UIAlertControllerStyleAlert presentViewController:self completeHandler:^(CPAlertController * _Nullable alertVC) {
            [alertVC addActionWithTitle:@"确定" color:CPLineColor() clickWithHandler:nil];
        }];
    }
}

- (void)takePhotoForLibraryWithEditing:(BOOL)edit
{
    UIImagePickerController *pick = [[UIImagePickerController alloc] init];
    pick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pick.delegate = self;
    pick.allowsEditing = edit;
    [pick.navigationBar setTintColor:[UIColor blackColor]];
    [self presentViewController:pick animated:YES completion:nil];
}



@end

