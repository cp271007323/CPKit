//
//  UINavigationBar+CP_Extension.h
//  CPNavItem
//
//  Created by chenp on 2019/7/13.
//  Copyright © 2018年 chenp. All rights reserved.
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


/**
 拍照、不裁剪
 */
- (void)takePhotoForCamera;

/**
 拍照、是否裁剪
 */
- (void)takePhotoForCameraWithEditing:(BOOL)edit;

/**
 相册选择图片、是否裁剪
 */
- (void)takePhotoForLibraryWithEditing:(BOOL)edit;

@end
