//
//  MainTabBarBarController.m
//  CPKit_Demo
//
//  Created by 陈平 on 2019/9/18.
//  Copyright © 2019 陈平. All rights reserved.
//

#import "MainTabBarBarController.h"
#import "ViewController.h"
#import <CPNavgationController/CPNavgationController.h>

@interface MainTabBarBarController ()

@end

@implementation MainTabBarBarController

#pragma mark - System


#pragma mark - Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitForMainTabBarBarController];
    [self setupBingdingForMainTabBarBarController];
}

#pragma mark - Pravite
-(void)setupInitForMainTabBarBarController
{
    [self addChildViewController:[CPNavgationController rootViewController:[ViewController new]]];
    [self addChildViewController:[CPNavgationController rootViewController:[ViewController new]]];
    [self addChildViewController:[CPNavgationController rootViewController:[ViewController new]]];
    
//    [self addChildViewController:[ViewController new]];
//    [self addChildViewController:[ViewController new]];
//    [self addChildViewController:[ViewController new]];
    
}


-(void)setupBingdingForMainTabBarBarController
{
    
    
}

#pragma mark - Public



#pragma mark - get


@end