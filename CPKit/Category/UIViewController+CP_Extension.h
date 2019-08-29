//
//  UINavigationBar+CP_Extension.h
//  CPNavItem
//
//  Created by RouXiAntique_Shop on 2019/7/13.
//  Copyright © 2018年 RouXiAntique_Shop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CP_Extension)

@property (nonatomic , assign) UIBarButtonSystemItem systemItem;

@end


@interface UIViewController (CP_Extension)<
UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@property (nonatomic , assign) CGFloat cp_leftNavItemSpacing;

@property (nonatomic , assign) CGFloat cp_rightNavItemSpacing;

- (void)takePhotoForViewController;

- (void)takePhotoForViewControllerForEditing:(BOOL)edit;

@end
