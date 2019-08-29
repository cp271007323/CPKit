//
//  UITabBarController+Extension.h
//  RouXiAntique_Shop
//
//  Created by RouXiAntique_Shop on 2019/7/23.
//  Copyright © 2019 RouXiAntique_Shop. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (Extension)

-(void)addChildViewController:(UIViewController *)childController
                        title:(NSString *)title
                     selImage:(NSString *)selImage
                   noSelImage:(NSString *)noSelmage;

@end

NS_ASSUME_NONNULL_END
