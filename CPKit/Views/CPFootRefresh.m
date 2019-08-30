//
//  CPFootRefresh.m
//  RouXiAntique_Shop
//
//  Created by RouXiAntique_Shop on 2017/11/24.
//  Copyright © 2017年 xxf. All rights reserved.
//

#import "CPFootRefresh.h"
#import "CPKit.h"

@interface CPFootRefresh () 
@property (nonatomic , assign) NSInteger                    showStatusPage;
@property (nonatomic , copy) CPFootRefreshCurrentPageBlock  currentPageBlock;
@end

@implementation CPFootRefresh

+(instancetype)cpFooterWithRefreshingBlock:(CPFootRefreshBaseBlock)refreshBolck
                            showStatusPage:(NSInteger)showStatusPage
                               currentPage:(CPFootRefreshCurrentPageBlock)currentPageBlock
{
    CPFootRefresh *footRefresh = [CPFootRefresh footerWithRefreshingBlock:refreshBolck];
    footRefresh.showStatusPage = showStatusPage;
    footRefresh.currentPageBlock = currentPageBlock;
    footRefresh.automaticallyChangeAlpha = YES;
    return footRefresh;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        kWeakObject(self)
        self.stateLabel.textColor = CPColor(@"bdbdbd");
        self.stateLabel.font = CPFont_Regular(13);
        [[RACObserve(self, state) skip:1] subscribeNext:^(id  _Nullable x) {
            
            kStrongObject(self)
            
//            /** 普通闲置状态 */
//            MJRefreshStateIdle = 1,
//            /** 松开就可以进行刷新的状态 */
//            MJRefreshStatePulling,
//            /** 正在刷新中的状态 */
//            MJRefreshStateRefreshing,
//            /** 即将刷新的状态 */
//            MJRefreshStateWillRefresh,
//            /** 所有数据加载完毕，没有更多的数据了 */
//            MJRefreshStateNoMoreData
            
//            CPLog(@"%@",x)
            
            NSInteger currentPage = self.currentPageBlock();
            //没有更多数据
            if (self.state == MJRefreshStateNoMoreData)
            {
                self.scrollView.mj_footer = nil;
                if (currentPage >= self.showStatusPage)
                {
                    self.scrollView.mj_footer = self;
                }
            }
            //其他
            else
            {
                self.scrollView.mj_footer = self;
            }
            
            
        }];
    }
    return self;
}

#pragma mark - get

@end
