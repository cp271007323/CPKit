//
//  CPFootRefresh.h
//  Mac
//
//  Created by Mac on 2017/11/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

typedef NSInteger(^CPFootRefreshCurrentPageBlock)(void);
typedef void(^CPFootRefreshBaseBlock)(void);

@interface CPFootRefresh : MJRefreshAutoStateFooter

+(instancetype)cpFooterWithRefreshingBlock:(CPFootRefreshBaseBlock)refreshBolck
                            showStatusPage:(NSInteger)showStatusPage
                               currentPage:(CPFootRefreshCurrentPageBlock)currentPageBlock;

@end
