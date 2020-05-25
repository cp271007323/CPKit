//
//  UITabBarController+Extension.m
//  Mac
//
//  Created by Mac on 2019/7/23.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "UITabBarController+Extension.h"
#import "CPKit.h"

@implementation UITabBarController (Extension)


-(void)addChildViewController:(UIViewController *)childController
                        title:(NSString *)title
                     selColor:(UIColor *)selColor
                     selImage:(NSString *)selImage
                   noSelColor:(UIColor *)noSelColor
                   noSelImage:(NSString *)noSelmage;
{
    [self addChildViewController:childController];
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [[CPImageName(noSelmage) imageWithColor:noSelColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[CPImageName(selImage) imageWithColor:selColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11] , NSForegroundColorAttributeName : noSelColor} forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11] , NSForegroundColorAttributeName : selColor} forState:UIControlStateSelected];
}


@end
