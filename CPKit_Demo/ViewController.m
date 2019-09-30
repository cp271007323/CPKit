//
//  ViewController.m
//  CPKit_Demo
//
//  Created by chenp on 2019/8/30.
//  Copyright © 2019 chenp. All rights reserved.
//

#import "ViewController.h"
#import "CPKit.h"
#import "CPAlertController.h"

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
            
            [CPAlertController alertControllerWithTitle:@"123" message:@"123123123" preferredStyle:UIAlertControllerStyleActionSheet presentViewController:self completeHandler:^(CPAlertController *alertVC) {
                [alertVC addTextFieldWithPlaceholder:@"你好1" configurationHandler:^(UITextField * _Nullable textField) {
                    textField.textColor = [UIColor redColor];
                }];
                [alertVC addTextFieldWithPlaceholder:@"你好2" configurationHandler:^(UITextField * _Nullable textField) {
                    textField.textColor = [UIColor yellowColor];
                }];
                [alertVC addTextFieldWithPlaceholder:@"你好3" configurationHandler:^(UITextField * _Nullable textField) {
                    textField.textColor = [UIColor orangeColor];
                }];
                
                [alertVC addCancelActionWithTitle:@"取消" color:[UIColor redColor] clickWithHandler:^(CPAlertController *alertVC, UIAlertAction *action) {
                    CPLog(@">>>")
                }];
                [alertVC addActionWithTitle:@"确定" color:[UIColor blackColor] clickWithHandler:^(CPAlertController *alertVC, UIAlertAction *action) {
                    CPLog(@">>>>>>");
                }];
                
            }];
            
            
        }];
        [btn setTitleColor:CPMainColor() forState:UIControlStateNormal];
    }];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CPLog(@"%@",[UIView getCurrentViewController]);
}

@end
