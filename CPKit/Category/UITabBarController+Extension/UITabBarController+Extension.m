//
//  UITabBarController+Extension.m
//  chenp
//
//  Created by chenp on 2019/7/23.
//  Copyright © 2019 chenp. All rights reserved.
//

#import "UITabBarController+Extension.h"
#import "CPKit.h"

@implementation UITabBarController (Extension)


-(void)addChildViewController:(UIViewController *)childController
                        title:(NSString *)title
                     selImage:(NSString *)selImage
                   noSelImage:(NSString *)noSelmage
{
    [self addChildViewController:childController];
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = [[CPImageName(noSelmage) imageWithColor:CPColor(@"aba3a3")] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[CPImageName(selImage) imageWithColor:CPMainColor()] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11] , NSForegroundColorAttributeName : CPColor(@"aba3a3")} forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11] , NSForegroundColorAttributeName : CPMainColor()} forState:UIControlStateSelected];
    
}


@end
