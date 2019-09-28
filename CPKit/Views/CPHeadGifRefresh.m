//
//  CPHeadGifRefresh.m
//  RouXiAntique_Shop
//
//  Created by RouXiAntique_Shop on 2017/11/24.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import "CPHeadGifRefresh.h"
#import "CPKit.h"

@interface CPHeadGifRefresh ()
@property (nonatomic , strong) NSMutableArray<UIImage *> *gifImages;
@end

@implementation CPHeadGifRefresh

+(instancetype)cpHeaderWithRefreshingBlock:(void (^)(void))refreshingBlock{
    CPHeadGifRefresh *headRefresh = [CPHeadGifRefresh headerWithRefreshingBlock:refreshingBlock];
    [headRefresh setImages:headRefresh.gifImages forState:MJRefreshStateIdle];
    [headRefresh setImages:headRefresh.gifImages forState:MJRefreshStateRefreshing];
    [headRefresh setImages:headRefresh.gifImages forState:MJRefreshStatePulling];
//    if (headRefresh.gifImages.count != 0)
//    {
//        headRefresh.stateLabel.hidden = YES;
        headRefresh.lastUpdatedTimeLabel.hidden = YES;
//    }
    headRefresh.stateLabel.font = CPFont_Regular(13);
    headRefresh.stateLabel.textColor = CPColor(@"bdbdbd");
    headRefresh.lastUpdatedTimeLabel.font = CPFont_Regular(13);
    headRefresh.lastUpdatedTimeLabel.textColor = CPColor(@"bdbdbd");
    headRefresh.automaticallyChangeAlpha = YES;
    return headRefresh;
}

+(instancetype)cpHeaderWithRefreshingTarget:(id)tagert refreshingAction:(SEL)sel{
    CPHeadGifRefresh *headRefresh = [CPHeadGifRefresh headerWithRefreshingTarget:tagert refreshingAction:sel];
    [headRefresh setImages:headRefresh.gifImages forState:MJRefreshStateIdle];
    [headRefresh setImages:headRefresh.gifImages forState:MJRefreshStateRefreshing];
    [headRefresh setImages:headRefresh.gifImages forState:MJRefreshStatePulling];
//    if (headRefresh.gifImages.count != 0)
//    {
//        headRefresh.stateLabel.hidden = YES;
        headRefresh.lastUpdatedTimeLabel.hidden = YES;
//    }
    headRefresh.stateLabel.font = CPFont_Regular(13);
    headRefresh.stateLabel.textColor = CPColor(@"bdbdbd");
    headRefresh.lastUpdatedTimeLabel.font = CPFont_Regular(13);
    headRefresh.lastUpdatedTimeLabel.textColor = CPColor(@"bdbdbd");
    headRefresh.automaticallyChangeAlpha = YES;
    return headRefresh;
}

#pragma mark - get
- (NSMutableArray<UIImage *> *)gifImages{
    if (_gifImages == nil)
        {
        _gifImages = [NSMutableArray array];
        for (NSInteger i = 0; i < 16; i ++)
        {
//            [_gifImages addObject:imageName([NSString stringWithFormat:@"drowdown_refresh%ld",i])];
        }
    }
    return _gifImages;
    
}


@end
