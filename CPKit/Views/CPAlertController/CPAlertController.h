//
//  CPAlertController.h
//  CPKit_Demo
//
//  Created by chenp on 2019/9/30.
//  Copyright © 2019 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPAlertController;

typedef void(^ CPAlertControllerClickHandlerBlock)(CPAlertController * _Nullable alertVC , UIAlertAction * _Nullable action);
typedef void(^ CPAlertControllerHandlerBlock)(CPAlertController * _Nullable  alertVC);
typedef void(^ CPAlertControllerTextFieldHandlerBlock)(UITextField * _Nullable textField);

NS_ASSUME_NONNULL_BEGIN

@interface CPAlertController : UIAlertController

/**
 初始化
 */
+ (void)alertControllerWithTitle:(nullable NSString *)title
                         message:(nullable NSString *)message
                  preferredStyle:(UIAlertControllerStyle)preferredStyle
           presentViewController:(__kindof UIViewController *)viewController
                 completeHandler:(CPAlertControllerHandlerBlock)completeHandler;

/**
 添加b普通键标题、点击回调代码块
 */
- (void)addActionWithTitle:(NSString *)title color:(UIColor *)color clickWithHandler:(_Nullable CPAlertControllerClickHandlerBlock)block;


/**
 添加取消键标题、点击回调代码块
 */
- (void)addCancelActionWithTitle:(NSString *)title color:(UIColor *)color clickWithHandler:(_Nullable CPAlertControllerClickHandlerBlock)block;

/**
 添加输入框
 */
- (void)addTextFieldWithPlaceholder:(NSString *)placeholder configurationHandler:(_Nullable CPAlertControllerTextFieldHandlerBlock)configurationHandler;


@end

NS_ASSUME_NONNULL_END
