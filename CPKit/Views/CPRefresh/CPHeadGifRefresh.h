//
//  CPHeadGifRefresh.h
//  chenp
//
//  Created by chenp on 2017/11/24.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface CPHeadGifRefresh : MJRefreshGifHeader

+(instancetype)cpHeaderWithRefreshingBlock:(void (^)(void))refreshingBlock;

+(instancetype)cpHeaderWithRefreshingTarget:(id)tagert refreshingAction:(SEL)sel;

@end
