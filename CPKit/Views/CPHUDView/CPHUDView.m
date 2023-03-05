//
//  CPLaHUDView.m
//  OuLa
//
//  Created by Mac on 2021/6/23.
//

#import "CPHUDView.h"
#import "CPKit.h"

typedef enum : NSUInteger {
    CPHUDViewType_Text,
    CPHUDViewType_Progress,
} CPLaHUDViewType;

#define KAnimationSec 3

@interface CPHUDView ()
@property (nonatomic , strong) UIView *backView1;
@property (nonatomic , strong) YYLabel *lab;
@property (nonatomic , strong) UIImageView *imageView;
@property (nonatomic , strong) UIView *loadingBackView;
@property (nonatomic , assign) UIView *superView;
@property (nonatomic , assign) CPLaHUDViewType type;
@property (nonatomic , copy) CPHUDViewComplete complete;
@property (nonatomic , strong) RACDisposable *animationDis;
@property (nonatomic , strong) NSTimer *timer;
@property (nonatomic , assign) NSInteger sec;
@end

@implementation CPHUDView


#pragma mark - Life
+ (void)showStartProgressHUDAddedTo:(UIView *)view animated:(BOOL)animated
{
    CPHUDView *hud = [[CPHUDView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) beView:view];
    hud.tag = 99991;
    [hud showStartProgressHUDWithText:@"" complete:nil];
}

+ (void)dissEndProgressHUDForView:(UIView *)view animated:(BOOL)animated
{
    CPHUDView *hud = (CPHUDView *)[view viewWithTag:99991];
    [UIView animateWithDuration:.1 animations:^{
        hud.transform = CGAffineTransformMakeScale(.5, .5);
        hud.alpha = 0;
    } completion:^(BOOL finished) {
        [hud removeFromSuperview];
    }];
}

+ (instancetype)hudViewBeView:(UIView *)superView
{
    CPHUDView *view = [[CPHUDView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) beView:superView];
    return view;
}

+ (void)showHUDWithText:(NSString *)text complete:(CPHUDViewComplete)complete
{
    UIViewController *viewController = [UIView getCurrentViewController];
    if ([viewController isKindOfClass:UINavigationController.class]) {
        UINavigationController *nav = (UINavigationController *)viewController;
        viewController = nav.viewControllers.lastObject;
    }
    CPHUDView *view = [[CPHUDView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) beView:viewController.view];
    [view showHUDWithText:text complete:complete];
}

+ (void)showHUDWithText:(NSString *)text
{
    [self showHUDWithText:text complete:nil];
}

- (void)dealloc
{
    [self.animationDis dispose];
    [self stopTimer];
    CPLog(@"%@----dealloc",self.className);
}

- (instancetype)initWithFrame:(CGRect)frame beView:(UIView *)superView
{
    self = [super initWithFrame:frame];
    if (self) {
        self.superView = superView;
        [self setupInitLayoutForCPLaHUDView];
        [self setupInitBindingForCPLaHUDView];
    }
    return self;
}

#pragma mark - Private
- (void)setupInitLayoutForCPLaHUDView
{
    [self sd_addSubviews:@[self.backView1,self.lab]];
    
    self.backView1.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .bottomSpaceToView(self, CPAuto(2));
    [self.backView1 setSd_cornerRadius:@6];
    
    self.lab.sd_layout
    .widthIs(20)
    .heightIs(20)
    .topSpaceToView(self, CPAuto(15))
    .leftSpaceToView(self, CPAuto(15))
    .maxWidthIs(CPScreenWidth() * .7);
    
    [self setupAutoWidthWithRightView:self.lab rightMargin:CPAuto(15)];
    [self setupAutoHeightWithBottomView:self.lab bottomMargin:CPAuto(15)];
}

- (void)setupInitBindingForCPLaHUDView
{
    
}

- (void)startLoadingAnimation
{
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear animations:^{
        self.loadingBackView.transform = CGAffineTransformRotate(self.loadingBackView.transform, M_PI);
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    } completion:nil];
}

- (void)stopLoadingAnimation
{
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.loadingBackView.transform = CGAffineTransformIdentity;
        self.imageView.transform = CGAffineTransformIdentity;
    } completion:NULL];
}

- (void)setTextToLabWithText:(NSString *)text needProgress:(BOOL)needProgress
{
    NSMutableAttributedString *att = [NSMutableAttributedString attributedWithString:CPString(text) color:UIColor.whiteColor font:CPFont_Regular(15)];
    
    if (self.animationDis) {
        [self.animationDis dispose];
        self.animationDis = nil;
    }
    
    if (needProgress) {
        
        [self startLoadingAnimation];
        
        kWeakObject(self);
        if (self.superView.viewController)
        {
            self.animationDis = [[[CPNotificationCenter rac_addObserverForName:UIApplicationWillEnterForegroundNotification object:nil] merge:[self.superView.viewController rac_signalForSelector:@selector(viewWillAppear:)]] subscribeNext:^(NSNotification * _Nullable x) {
                kStrongObject(self);
                if (self.type == CPHUDViewType_Progress) {
                    [self startLoadingAnimation];
                }
            }];
        }
        
        NSMutableAttributedString *attchmentAtt = [NSMutableAttributedString attachmentStringWithContent:self.loadingBackView contentMode:UIViewContentModeCenter attachmentSize:self.loadingBackView.bounds.size alignToFont:CPFont_Regular(15) alignment:YYTextVerticalAlignmentCenter];
        
        if (text.length) {
            [att appendString:@" "];
        }
        [att insertAttributedString:attchmentAtt atIndex:0];
    }
    
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(CPScreenWidth() * .7, MAXFLOAT) text:att];
    
    self.lab.attributedText = att;
    self.lab.sd_layout
    .widthIs(layout.textBoundingRect.size.width)
    .heightIs(layout.textBoundingSize.height);
    
    [self.lab updateLayout];
}

#pragma mark - Public
- (void)showHUDWithText:(NSString *)text complete:(CPHUDViewComplete)complete
{
    self.type = CPHUDViewType_Text;
    text = text ?: @"";
    [self.superView addSubview:self];
    @try {
        [self setTextToLabWithText:text needProgress:NO];
    } @catch (NSException *exception) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setTextToLabWithText:text needProgress:NO];
        });
    } @finally {}
    self.centerX = self.superView.width * .5;
    self.centerY = self.superView.height * .5;
    [self updateLayout];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:.1 animations:^{
            self.transform = CGAffineTransformMakeScale(.5, .5);
            self.alpha = 0;
        } completion:^(BOOL finished) {
            CPBlock_invoke(complete);
            [self removeFromSuperview];
        }];
    });
    
    self.transform = CGAffineTransformMakeScale(.5, .5);
    self.alpha = 0;
    [UIView animateWithDuration:.1 animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1;
    }];
}

- (void)showStartProgressHUDWithText:(NSString *)text complete:(CPHUDViewComplete)complete
{
    self.transform = CGAffineTransformIdentity;
    self.type = CPHUDViewType_Progress;
    text = text ?: @"";
    self.complete = complete;
    [self.superView addSubview:self];
    @try {
        [self setTextToLabWithText:text needProgress:YES];
    } @catch (NSException *exception) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setTextToLabWithText:text needProgress:YES];
        });
    } @finally {}
    [self updateLayout];
    self.centerX = self.superView.width * .5;
    self.centerY = self.superView.height * .5;
    
    self.transform = CGAffineTransformMakeScale(.5, .5);
    self.alpha = 0;
//    [self startTimer];
    [UIView animateWithDuration:.1 animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1;
    }];
}

- (void)dissEndProgressHUD
{
    [UIView animateWithDuration:.1 animations:^{
        self.transform = CGAffineTransformMakeScale(.5, .5);
        self.alpha = 0;
    }];
}

- (void)updateTimer
{
    self.sec --;
    if (self.sec <= 0) {
        [self stopTimer];
        [self stopLoadingAnimation];
        self.transform = CGAffineTransformIdentity;
        [self removeFromSuperview];
    }
}

- (void)startTimer
{
    self.sec = KAnimationSec + 1;
    [self stopTimer];
    self.timer.fireDate = [NSDate distantPast];
}

- (void)stopTimer
{
    _timer.fireDate = [NSDate distantFuture];
    [_timer invalidate];
    _timer = nil;
}

#pragma mark - get
- (UIView *)backView1
{
    if (_backView1 == nil) {
        _backView1 = [UIView new];
        _backView1.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:.8];
    }
    return _backView1;
}

- (YYLabel *)lab
{
    if (_lab == nil) {
        _lab = [YYLabel new];
        _lab.clearContentsBeforeAsynchronouslyDisplay = NO;
        _lab.numberOfLines = 0;
    }
    return _lab;
}

- (UIView *)loadingBackView
{
    if (_loadingBackView == nil) {
        _loadingBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CPAuto(20), CPAuto(20))];
        
        [_loadingBackView addSubview:self.imageView];
        self.imageView.sd_layout
        .spaceToSuperView(UIEdgeInsetsZero);
    }
    return _loadingBackView;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.image = CPImageName(@"Global_icon_loading_nor");
    }
    return _imageView;
}

- (NSTimer *)timer
{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

@end
