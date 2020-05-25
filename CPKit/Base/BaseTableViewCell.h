//
//  BaseTableViewCell.h
//  Mac
//
//  Created by Mac on 2017/10/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

+(NSString *)identifier;

- (void)addBottomLineWithleft:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height;

@end


@interface BaseTableViewValue1Cell : BaseTableViewCell


@end
