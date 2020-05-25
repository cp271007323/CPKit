//
//  UITableView+Extension.m
//  MeetAll
//
//  Created by Mac on 2019/7/2.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "UITableView+Extension.h"
#import <objc/message.h>
#import "CPKit.h"

@implementation UITableView (Extension)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method old_Method1 = class_getInstanceMethod(self, @selector(reloadData));
        Method new_Method1 = class_getInstanceMethod(self, @selector(cp_reloadData));
        method_exchangeImplementations(old_Method1, new_Method1);
        
        Method old_Method2 = class_getInstanceMethod(self, @selector(reloadSections:withRowAnimation:));
        Method new_Method2 = class_getInstanceMethod(self, @selector(cp_reloadSections:withRowAnimation:));
        method_exchangeImplementations(old_Method2, new_Method2);
        
        Method old_Method3 = class_getInstanceMethod(self, @selector(initWithFrame:style:));
        Method new_Method3 = class_getInstanceMethod(self, @selector(cpinitWithFrame:style:));
        method_exchangeImplementations(old_Method3, new_Method3);
    });
}

- (instancetype)cpinitWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    UITableView *tableView = [self cpinitWithFrame:frame style:style];
    tableView.backView = [CPStatusTypeView statusTypeView];
    tableView.backView.widthSpace = CPAuto(183);
    tableView.backView.topSpace = CPAuto(71);
    tableView.backgroundView = tableView.backView;
    tableView.canScrollBackView = YES;
    [tableView cpSetupBingding];
    return tableView;
}

- (void)cpSetupBingding
{
    kWeakObject(self)
    [RACObserve(self.backView, frame) subscribeNext:^(id  _Nullable x) {
        kStrongObject(self)
        if (!self.unShowBackView && self.canScrollBackView)
        {
            CGRect frame = [x CGRectValue];
            if (frame.origin.y != 0)
            {
                frame.origin.y  = 0;
                if (self.canScrollBackView)
                {
                    self.backgroundView.frame = frame;
                }
            }
        }
    }];
}

- (void)cp_reloadData
{
    [self cp_reloadData];
    
    //  忽略第一次加载
    if (![self isInitFinish])
    {
        [self havingData:YES];
        [self setIsInitFinish:YES];
        return ;
    }
    
    //  刷新完成之后检测数据量
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //是否数据为空
        NSInteger numberOfSections = [self numberOfSections];
        BOOL havingData = NO;
        for (NSInteger i = 0; i < numberOfSections; i++)
        {
            if (![self.ignoreSectionShowBackViewArr containsObject:[NSNumber numberWithInteger:i]])
            {
                NSInteger count = [self numberOfRowsInSection:i];
                if (count > 0)
                {
                    havingData = YES;
                    break;
                }
            }
        }
        [self havingData:havingData];
    });
}

- (void)cp_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self cp_reloadData];
    
    //  忽略第一次加载
    if (![self isInitFinish])
    {
        [self havingData:YES];
        [self setIsInitFinish:YES];
        return ;
    }
    
    //  刷新完成之后检测数据量
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //是否数据为空
        NSInteger numberOfSections = [self numberOfSections];
        BOOL havingData = NO;
        for (NSInteger i = 0; i < numberOfSections; i++)
        {
            if (![self.ignoreSectionShowBackViewArr containsObject:[NSNumber numberWithInteger:i]])
            {
                NSInteger count = [self numberOfRowsInSection:i];
                if (count > 0)
                {
                    havingData = YES;
                    break;
                }
            }
        }
        [self havingData:havingData];
    });
}

- (void)havingData:(BOOL)isHave
{
    
    //当前是否有背景图
    if (![self.backgroundView isEqual:self.backView])
    {
        return ;
    }
    
    self.backView.hidden = isHave;
}

// 加载完数据的标记属性名
static NSString * const kXYTableViewPropertyInitFinish = @"kXYTableViewPropertyInitFinish";

/**
 设置已经加载完成数据了
 */
- (void)setIsInitFinish:(BOOL)finish {
    objc_setAssociatedObject(self, &kXYTableViewPropertyInitFinish, @(finish), OBJC_ASSOCIATION_ASSIGN);
}

/**
 是否已经加载完成数据
 */
- (BOOL)isInitFinish {
    id obj = objc_getAssociatedObject(self, &kXYTableViewPropertyInitFinish);
    return [obj boolValue];
}

- (void)setUnShowBackView:(BOOL)unShowBackView{
    self.backView.hidden = unShowBackView;
    objc_setAssociatedObject(self, @selector(unShowBackView), @(unShowBackView), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)unShowBackView{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setCanScrollBackView:(BOOL)canScrollBackView{
    objc_setAssociatedObject(self, @selector(canScrollBackView), @(canScrollBackView), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)canScrollBackView{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setBackView:(CPStatusTypeView *)backView
{
    objc_setAssociatedObject(self, @selector(backView), backView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CPStatusTypeView *)backView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setIgnoreSectionShowBackViewArr:(NSMutableArray<NSNumber *> *)ignoreSectionShowBackViewArr
{
    objc_setAssociatedObject(self, @selector(ignoreSectionShowBackViewArr), ignoreSectionShowBackViewArr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSMutableArray<NSNumber *> *)ignoreSectionShowBackViewArr
{
    return objc_getAssociatedObject(self, _cmd);
}

@end

