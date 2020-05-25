//
//  BaseTableViewTextFieldCell.h
//  SSZS
//
//  Created by Mac on 2018/9/20.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface BaseTableViewTextFieldCell : BaseTableViewCell

@property (nonatomic , strong) UITextField *textFieldView;

@property (nonatomic , assign) CGFloat rightSpacingForTextFieldView;

@end
