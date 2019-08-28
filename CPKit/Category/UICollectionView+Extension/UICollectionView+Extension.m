//
//  UICollectionView+Extension.m
//  SSZS
//
//  Created by 陈平 on 2019/2/17.
//  Copyright © 2019年 chenp. All rights reserved.
//

#import "UICollectionView+Extension.h"
#import <objc/message.h>
#import "Config.h"

@implementation UICollectionView (Extension)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method old_Method1 = class_getInstanceMethod(self, @selector(reloadData));
        Method new_Method1 = class_getInstanceMethod(self, @selector(cp_reloadData));
        method_exchangeImplementations(old_Method1, new_Method1);
        
        Method old_Method2 = class_getInstanceMethod(self, @selector(reloadSections:));
        Method new_Method2 = class_getInstanceMethod(self, @selector(cpReloadSections:));
        method_exchangeImplementations(old_Method2, new_Method2);
        
        Method old_Method3 = class_getInstanceMethod(self, @selector(initWithFrame:collectionViewLayout:));
        Method new_Method3 = class_getInstanceMethod(self, @selector(cpInitWithFrame:collectionViewLayout:));
        method_exchangeImplementations(old_Method3, new_Method3);
    });
}

- (instancetype)cpInitWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    UICollectionView *collectionView = [self cpInitWithFrame:frame collectionViewLayout:layout];
    collectionView.backView = [CPStatusTypeView statusTypeView];
    collectionView.backView.widthSpace = CPAuto(183);
    collectionView.backView.topSpace = CPAuto(71);
    collectionView.backgroundView = collectionView.backView;
    collectionView.canScrollBackView = YES;
    [collectionView cpSetupBingding];
    return collectionView;
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
                NSInteger count = [self numberOfItemsInSection:i];
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

- (void)cpReloadSections:(NSIndexSet *)sections
{
    [self cpReloadSections:sections];
    
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
                NSInteger count = [self numberOfItemsInSection:i];
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
