//
//  BaseViewController.m
//  Antique_Shop
//
//  Created by Mac on 2019/8/22.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "BaseViewController.h"
#import "UIViewController+CP_Extension.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import "CPKit.h"

@interface BaseViewController ()

/**
 导航底部线
 */
@property (nonatomic , strong) UIView *navBottomLine;

@end

@implementation BaseViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.isCurrentVC = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.isCurrentVC = NO;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self resetNavigationBarView];
    self.cp_leftNavItemSpacing = 0;
    self.cp_rightNavItemSpacing = 0;
}

#pragma mark - Private
- (void)resetNavigationBarView
{
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self hiddenHairlineImageViewUnder:self.navigationController.navigationBar];
    
    UIView *view = self.navigationController.navigationBar;
    [view.superview addSubview:self.navBarView];
    [view.superview insertSubview:self.navBarView belowSubview:view];
    self.navBarView.sd_layout
    .topEqualToView(view.superview)
    .leftEqualToView(view)
    .rightEqualToView(view)
    .bottomEqualToView(view);
    CPLog(@"%@",view);
    
    [self hiddenNavgationBarBottomLine:NO alphaNavgationBar:NO];
    [self showNavigationBarImage:NO image:[UIImage new]];
}

- (UIImageView *)hiddenHairlineImageViewUnder:(UIView *)view{
    
    if([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
        {
        view.hidden = YES;
        return(UIImageView *)view;
    }
    for(UIView *subview in view.subviews)
        {
        UIImageView *imageView = [self hiddenHairlineImageViewUnder:subview];
        if(imageView)
        {
            imageView.hidden = YES;
            return imageView;
        }
    }
    return nil;
    
}

#pragma mark - Public
- (void)setViewControllerTitle:(NSString *)title color:(UIColor *)color
{
    self.navigationItem.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : color , NSFontAttributeName : CPFont_Medium(18)}];
}

- (void)hiddenNavgationBarBottomLine:(BOOL)isHidden alphaNavgationBar:(BOOL)isAlpha
{
    self.navBottomLine.hidden = isHidden;
    self.navBarView.hidden = isAlpha;
}

- (void)showNavigationBarImage:(BOOL)show image:(UIImage *)image
{
    [self.navBarView viewWithTag:1].hidden = !show;
    ((UIImageView *)[self.navBarView viewWithTag:1]).image = image;
}

- (void)updateNavBarViewForHeight:(CGFloat)height layout:(void (^)(UIView *navBarView))layoutBlock
{
    self.navBarView.sd_layout
    .heightIs(height);
    if (layoutBlock) layoutBlock(self.navBarView);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return  0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_11_0

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

#endif

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [UICollectionViewCell new];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

#pragma mark - get
- (UIView *)navBarView{
    if (_navBarView == nil)
    {
        _navBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -[CPKitManager shareManager].systemStatusBarHeight, CPScreenWidth(), [CPKitManager shareManager].systemNavgationBarHeight)];
        _navBarView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 1;
        [_navBarView addSubview:imageView];
        imageView.sd_layout
        .spaceToSuperView(UIEdgeInsetsZero);
    }
    return _navBarView;
}

- (UIView *)navBottomLine
{
    if (_navBottomLine == nil) {
        _navBottomLine = [self.navBarView addBottomLineWithOffset:0 color:CPColor(@"dbdbdb")];
    }
    return _navBottomLine;
}

@end
