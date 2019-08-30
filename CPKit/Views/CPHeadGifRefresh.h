//
//  CPHeadGifRefresh.h
//  RouXiAntique_Shop
//
//  Created by RouXiAntique_Shop on 2017/11/24.
//  Copyright © 2017年 xxf. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface CPHeadGifRefresh : MJRefreshGifHeader

+(instancetype)cpHeaderWithRefreshingBlock:(void (^)(void))refreshingBlock;

+(instancetype)cpHeaderWithRefreshingTarget:(id)tagert refreshingAction:(SEL)sel;

@end
