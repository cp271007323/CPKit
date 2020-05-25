//
//  CPShareController.m
//  ActivityViewController多图分享
//
//  Created by Mac on 2019/7/12.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CPShareController.h"
#import "CPShareModel.h"
#import "CPKit.h"

@interface CPShareController ()
 
@end

@implementation CPShareController

#pragma mark - Life
+ (instancetype)sharaMangerWithTitle:(NSString *)title
                               image:(UIImage *)image
                                 url:(NSString *)url
{
    NSURL *urlToShare = [NSURL URLWithString:url];
    
    NSMutableArray *activityItems = [NSMutableArray array];
    if (title)
    {
        [activityItems addObject:title];
    }
    
    if (image)
    {
        [activityItems addObject:[[CPShareModel alloc] initWithImage:image]];
    }
    
    if (url)
    {
        [activityItems addObject:urlToShare];
    }
    
    CPShareController *manager = [[CPShareController alloc] initWithActivityItems:activityItems applicationActivities:@[[UIActivity new]]];
    
    manager.excludedActivityTypes = @[UIActivityTypePostToFacebook,
                                         UIActivityTypePostToTwitter,
                                         UIActivityTypeMessage,
                                         UIActivityTypeMail,
                                         UIActivityTypePrint,
                                         UIActivityTypeCopyToPasteboard,
                                         UIActivityTypeAssignToContact,
                                         UIActivityTypeSaveToCameraRoll,
                                         UIActivityTypeAddToReadingList,
                                         UIActivityTypePostToFlickr,
                                         UIActivityTypePostToVimeo,
                                         UIActivityTypeAirDrop];
    return manager;
}

+ (instancetype)sharaMangerWithTitle:(NSString *)title
                              images:(NSArray<UIImage *>*)images
{
    NSMutableArray *activityItems = [NSMutableArray array];
    if (title)
    {
        [activityItems addObject:title];
    }
    
    if (images.count)
    {
        [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [activityItems addObject:[[CPShareModel alloc] initWithImage:obj]];
        }];
    }
    
    CPShareController *manager = [[CPShareController alloc] initWithActivityItems:activityItems applicationActivities:@[[UIActivity new]]];
    
    manager.excludedActivityTypes = @[UIActivityTypePostToFacebook,
                                      UIActivityTypePostToTwitter,
                                      UIActivityTypeMessage,
                                      UIActivityTypeMail,
                                      UIActivityTypePrint,
                                      UIActivityTypeCopyToPasteboard,
                                      UIActivityTypeAssignToContact,
                                      UIActivityTypeSaveToCameraRoll,
                                      UIActivityTypeAddToReadingList,
                                      UIActivityTypePostToFlickr,
                                      UIActivityTypePostToVimeo,
                                      UIActivityTypeAirDrop];
    return manager;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitForCPShareController];
    [self setupBingdingForCPShareController];
}

#pragma mark - Pravite
-(void)setupInitForCPShareController
{
    
}


-(void)setupBingdingForCPShareController
{
    
}

#pragma mark - Public
- (void)shareWithViewController:(UIViewController *)viewController view:(UIView *)view
{
    if (isIPad)
    {
        UIPopoverPresentationController *pop = self.popoverPresentationController;
        pop.sourceView = viewController.view;
        pop.sourceRect = [view convertRect:view.frame toView:nil];
        pop.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    [viewController presentViewController:self animated:YES completion:nil];
}




#pragma mark - get

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
