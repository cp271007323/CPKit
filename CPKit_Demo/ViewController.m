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
#import "HomeViewController.h"
#import "SearchViewController.h"

@interface ViewController ()

@property (nonatomic , strong) CPBaseTextView *textView;

@property (nonatomic , strong) UITextField *nicknameTextField;

@property (nonatomic , strong) UILabel *noteLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CPRandomColor();
    
//    [self.view sd_addSubviews:@[self.textView,self.nicknameTextField,self.noteLab]];
//
//    self.textView.sd_layout
//    .topSpaceToView(self.view, CPKitManager.shareManager.systemNavgationBarHeight + CPAuto(10))
//    .leftSpaceToView(self.view, CPAuto(15))
//    .rightSpaceToView(self.view, CPAuto(15))
//    .heightIs(CPAuto(100));
//
//    self.noteLab.sd_layout
//    .rightEqualToView(self.textView)
//    .topSpaceToView(self.textView, 10)
//    .autoHeightRatio(0);
//    [self.noteLab setSingleLineAutoResizeWithMaxWidth:200];
//
//    self.nicknameTextField.sd_layout
//    .topSpaceToView(self.textView, 30)
//    .leftSpaceToView(self.view, CPAuto(15))
//    .rightSpaceToView(self.view, CPAuto(15))
//    .heightIs(CPAuto(40));
//
//    [[self.nicknameTextField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
//        [UITextField limitTextField:self.nicknameTextField limitNumber:11 limitHandeler:nil];
//    }];
//
//    [[self.textView.textView rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
//        self.noteLab.text = [NSString stringWithFormat:@"%ld/20",x.length];
//    }];
    
    UIBarButtonItem *item1 = [UIBarButtonItem barButtonTitle:@"你好bububu" image:nil button:^(CPNumberBtn *btn) {
        [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    }];
    UIBarButtonItem *item2 = [UIBarButtonItem barButtonTitle:@"不好" image:nil button:^(CPNumberBtn *btn) {
        [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    }];
    self.navigationItem.rightBarButtonItems = @[item1,item2];
}


- (CPBaseTextView *)textView
{
    if (_textView == nil) {
        _textView = [CPBaseTextView baseTextView];
        _textView.limitMaxCount = 20;
        [_textView.textView insertText:@"1234567890"];
        _textView.textFont = CPFont_Medium(17);
        _textView.textInset = UIEdgeInsetsMake(20, 15, 20, 15);
        _textView.backgroundColor = CPColor(@"#F6F6F6");
    }
    return _textView;
}

-(UITextField *)nicknameTextField
{
    if (_nicknameTextField == nil) {
        _nicknameTextField = [UITextField new];
        _nicknameTextField.placeholder = @"Please enter a nickname";
        _nicknameTextField.textColor = CPColor(@"#000000");
        _nicknameTextField.placeholdColor = CPColor(@"dcdcdc");
        _nicknameTextField.backgroundColor = UIColor.whiteColor;
        _nicknameTextField.font = CPFont_Regular(15);
        _nicknameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        _nicknameTextField.leftView = leftView;
        _nicknameTextField.leftViewMode = UITextFieldViewModeAlways;
        _nicknameTextField.delegate = self;
    }
    return _nicknameTextField;
}

- (UILabel *)noteLab
{
    if (_noteLab == nil) {
        _noteLab = [UILabel new];
        _noteLab.textColor = CPColor(@"666666");
        _noteLab.font = CPFont_Regular(13);
    }
    return _noteLab;
}

@end
