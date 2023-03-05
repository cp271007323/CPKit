//
//  CPLaHUDView.h
//  OuLa
//
//  Created by Mac on 2021/6/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CPHUDViewComplete)(void);

@interface CPHUDView : UIView

+ (instancetype)hudViewBeView:(UIView *)superView;

/// 搭配使用
+ (void)showStartProgressHUDAddedTo:(UIView *)view animated:(BOOL)animated;
+ (void)dissEndProgressHUDForView:(UIView *)view animated:(BOOL)animated;;

/// 快速生成提示框
+ (void)showHUDWithText:(NSString *)text complete:(_Nullable CPHUDViewComplete)complete;
+ (void)showHUDWithText:(NSString *)text;


/// 加载框和结束加载框配合使用
- (void)showStartProgressHUDWithText:(NSString *)text complete:(_Nullable CPHUDViewComplete)complete;
- (void)dissEndProgressHUD;

@end

NS_ASSUME_NONNULL_END
