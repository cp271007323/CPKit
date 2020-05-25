//
//  UITabBarController+Extension.h
//  Mac
//
//  Created by Mac on 2019/7/23.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (Extension)

-(void)addChildViewController:(UIViewController *)childController
                        title:(NSString *)title
                     selColor:(UIColor *)selColor
                     selImage:(NSString *)selImage
                   noSelColor:(UIColor *)noSelColor
                   noSelImage:(NSString *)noSelmage;

@end

NS_ASSUME_NONNULL_END
