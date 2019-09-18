//
//  ViewController.m
//  CPKit_Demo
//
//  Created by 陈平 on 2019/8/30.
//  Copyright © 2019 陈平. All rights reserved.
//

#import "ViewController.h"
#import "CPKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonTitle:@"跳转" image:nil button:^(UIButton *btn) {
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//            [self presentViewController:[CPNavgationController rootViewController:[ViewController new]] animated:YES completion:nil];
            [self.navigationController pushViewController:[ViewController new] animated:YES];
        }];
        [btn setTitleColor:CPMainColor() forState:UIControlStateNormal];
    }];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonTitle:@"弹窗" image:nil button:^(UIButton *btn) {
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"123" message:@"123" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                CPLog(@"%@",[UIView getCurrentViewController]);
            }];
            [alertVC addAction:cancleAction];
            [self presentViewController:alertVC animated:YES completion:nil];
            CPLog(@"%@",[UIView getCurrentViewController]);
        }];
        [btn setTitleColor:CPMainColor() forState:UIControlStateNormal];
    }];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CPLog(@"%@",[UIView getCurrentViewController]);
}

@end
