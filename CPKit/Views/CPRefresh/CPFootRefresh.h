//
//  CPFootRefresh.h
//  chenp
//
//  Created by chenp on 2017/11/24.
//  Copyright © 2017年 chenp. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

typedef NSInteger(^CPFootRefreshCurrentPageBlock)(void);
typedef void(^CPFootRefreshBaseBlock)(void);

@interface CPFootRefresh : MJRefreshAutoStateFooter

+(instancetype)cpFooterWithRefreshingBlock:(CPFootRefreshBaseBlock)refreshBolck
                            showStatusPage:(NSInteger)showStatusPage
                               currentPage:(CPFootRefreshCurrentPageBlock)currentPageBlock;

@end