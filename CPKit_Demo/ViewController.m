//
//  ViewController.m
//  CPKit_Demo
//
//  Created by Mac on 2019/8/30.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "ViewController.h"
#import "CPKit.h"
#import "CPAlertController.h"
#import "CPModel.h"
#import <CPNavgationController/CPNavgationController.h>
#import "HomeViewController.h"
#import "SearchViewController.h"

@interface ViewController ()<
UISearchBarDelegate>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) UISearchController *searchController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setViewControllerTitle:@"你好" color:CPColor(@"222222")];
    self.view.backgroundColor = CPRandomColor();
    
    self.definesPresentationContext = YES;
    
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    CPLog(@"123123");
}

#pragma mark - UISearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController
{
    self.cp_popGestureDisenabled = YES;
    self.cp_navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.cp_navigationController.interactivePopGestureRecognizer.delegate = nil;
    [searchController.searchBar setShowsCancelButton:YES animated:YES];
}

- (void)willDismissSearchController:(UISearchController *)searchController
{
    self.cp_popGestureDisenabled = NO;
    self.cp_navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.cp_navigationController.interactivePopGestureRecognizer.delegate = self.cp_navigationController;
    [searchController.searchBar setShowsCancelButton:NO animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BaseTableViewCell.identifier];
    cell.backgroundColor = CPRandomColor();
    return cell;
}

-(UITableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableHeaderView = self.searchController.searchBar;
        [UIView estimatedForTableView:_tableView];
        [_tableView registerClass:[BaseTableViewCell class] forCellReuseIdentifier:[BaseTableViewCell identifier]];
    }
    return _tableView;
}

- (UISearchController *)searchController
{
    if (_searchController == nil) {
        SearchViewController *vc = [SearchViewController new];
        _searchController = [[UISearchController alloc] initWithSearchResultsController:vc];
        _searchController.searchResultsUpdater = vc;
        _searchController.view.backgroundColor = UIColor.whiteColor;
        _searchController.searchBar.delegate = self;
        _searchController.delegate = self;
        _searchController.searchBar.backgroundImage = [UIImage new];
        _searchController.searchBar.backgroundColor = UIColor.whiteColor;
    }
    return _searchController;
}

@end
