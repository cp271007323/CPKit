//
//  CPHeadGifRefresh.h
//  Mac
//
//  Created by Mac on 2017/11/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface CPHeadGifRefresh : MJRefreshGifHeader

+(instancetype)cpHeaderWithRefreshingBlock:(void (^)(void))refreshingBlock;

+(instancetype)cpHeaderWithRefreshingTarget:(id)tagert refreshingAction:(SEL)sel;

@end
