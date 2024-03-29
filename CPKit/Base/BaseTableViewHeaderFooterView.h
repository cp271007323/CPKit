//
//  BaseTableViewHeaderFooterView.h
//  Mac
//
//  Created by Mac on 2017/11/28.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic , copy) NSString *title;

@property (nonatomic , strong, readonly) UILabel *titleLab;

@property (nonatomic , strong, readonly) UIButton *nextBtn;

@property (nonatomic , assign) BOOL showNextImage;

+ (NSString *)identifier;

@end
