//
//  CPAlertController.m
//  CPKit_Demo
//
//  Created by chenp on 2019/9/30.
//  Copyright © 2019 chenp. All rights reserved.
//

#import "CPAlertController.h"

@interface CPAlertController ()

@end

@implementation CPAlertController

#pragma mark - System


#pragma mark - Life
+ (void)alertControllerWithTitle:(nullable NSString *)title
                         message:(nullable NSString *)message
                  preferredStyle:(UIAlertControllerStyle)preferredStyle
           presentViewController:(__kindof UIViewController *)viewController
                 completeHandler:(CPAlertControllerHandlerBlock)completeHandler
{
    CPAlertController *alertVC = [self alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if (completeHandler) {
        completeHandler(alertVC);
    }
    [alertVC showAlertControllerForPresentViewController:viewController];
}

- (void)addActionWithTitle:(NSString *)title
                     color:(UIColor *)color
                     style:(UIAlertActionStyle)style
          clickWithHandler:(CPAlertControllerClickHandlerBlock)block
{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction * _Nonnull action) {
        if (block)
        {
            block(self,action);
        }
    }];
    [self addAction:action];
    
    if (([UIDevice currentDevice].systemVersion.floatValue >= 9.0f))
    {
        [action setValue:color forKey:@"titleTextColor"];
    }
}

#pragma mark - Public
- (void)addActionWithTitle:(NSString *)title color:(UIColor *)color clickWithHandler:(CPAlertControllerClickHandlerBlock)block
{
    [self addActionWithTitle:title color:color style:UIAlertActionStyleDefault clickWithHandler:block];
}

- (void)addCancelActionWithTitle:(NSString *)title color:(UIColor *)color clickWithHandler:(CPAlertControllerClickHandlerBlock)block
{
    [self addActionWithTitle:title color:color style:UIAlertActionStyleCancel clickWithHandler:block];
}

- (void)addTextFieldWithPlaceholder:(NSString *)placeholder configurationHandler:(CPAlertControllerTextFieldHandlerBlock)configurationHandler;
{
    if (self.preferredStyle != UIAlertControllerStyleActionSheet)
    {
        [self addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = placeholder;
            if (configurationHandler)
            {
                configurationHandler(textField);
            }
        }];
    }
}

- (void)showAlertControllerForPresentViewController:(__kindof UIViewController *)viewController
{
    [viewController presentViewController:self animated:YES completion:nil];
}

@end
