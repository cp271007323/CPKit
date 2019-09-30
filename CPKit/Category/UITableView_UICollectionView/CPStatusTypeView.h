//
//  CPStatusTypeView.h
//  MeetAll
//
//  Created by chenp on 2019/7/2.
//  Copyright © 2018年 chenp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>

typedef enum : NSUInteger {
    //没有数据
    CPStatusType_NoData,
    //没有开启网络
    CPStatusType_NoOpenNet,
    //网络异常
    CPStatusType_FailNet,
    //其他需要按钮和图片
    CPStatusType_other,
} CPStatusType;

typedef void(^BaseCompelete)(void);
typedef void(^CPStatusTypeBlock)(CPStatusType type);


@interface CPStatusTypeView : UIView

/**
 图片
 */
@property (nonatomic , strong) UIImageView *imageView;

/**
 标题
 */
@property (nonatomic , strong) UILabel *contentLab;

/**
 按钮
 */
@property (nonatomic , strong) UIButton *submitBtn;

/**
 类型
 */
@property (nonatomic , assign) CPStatusType type;

/**
 顶部距离
 */
@property (nonatomic , assign) CGFloat topSpace;

/**
 图片大小
 */
@property (nonatomic , assign) CGFloat widthSpace;

/**
 初始化
 */
+(instancetype)statusTypeView;

/**
 异常显示写入信号成功回执
 */
- (void)setCommand:(RACCommand *)signalCommand
   refreshCallBack:(CPStatusTypeBlock)callBack;


@end

