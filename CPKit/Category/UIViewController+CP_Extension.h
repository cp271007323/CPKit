//
//  UINavigationBar+CP_Extension.h
//  CPNavItem
//
//  Created by 陈平 on 2018/3/13.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CP_Extension)

@property (nonatomic , assign) UIBarButtonSystemItem systemItem;

@end


@interface UIViewController (CP_Extension)

@property (nonatomic , assign) CGFloat cp_leftNavItemSpacing;

@property (nonatomic , assign) CGFloat cp_rightNavItemSpacing;

@end
