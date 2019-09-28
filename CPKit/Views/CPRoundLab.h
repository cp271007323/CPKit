//
//  CPRoundLab.h
//  MeetAll
//
//  Created by chenp on 2018/2/23.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPKit.h"

typedef enum : NSUInteger {
    //数字
    CPRoundLabType_Number,
    //点
    CPRoundLabType_Point,
} CPRoundLabType;

@interface CPRoundLab : UIView

/**
 数量
 */
@property (nonatomic , assign) NSInteger number;

/**
 点直径大小(默认11)
 */
@property (nonatomic , assign) CGFloat pointWith;

/**
 类型
 */
@property (nonatomic , assign) CPRoundLabType type;

@end
