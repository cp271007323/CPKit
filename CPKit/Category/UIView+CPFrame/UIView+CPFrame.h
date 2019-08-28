//
//  UIView+CPFrame.h
//  CP_Category
//
//  Created by lk03 on 17/5/18.
//  Copyright © 2017年 KKJY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CPFrame)

@property CGFloat CP_Width;
@property CGFloat CP_Height;
@property CGFloat CP_X;
@property CGFloat CP_Y;
@property CGFloat CP_CenterX;
@property CGFloat CP_CenterY;

@property CGFloat CP_right;
@property CGFloat CP_bottom;
@end

@interface UIView (line)

- (UIView *)addBottomLineWithOffset:(CGFloat)offset color:(UIColor *)color;
- (UIView *)addBottomLineWithOffset:(CGFloat)offset color:(UIColor *)color height:(CGFloat)height;
- (UIView *)addBottomLineWithOffset:(CGFloat)offset left:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height;

- (UIView *)addTopLineWithOffset:(CGFloat)offset color:(UIColor *)color;
- (UIView *)addTopLineWithOffset:(CGFloat)offset color:(UIColor *)color height:(CGFloat)height;
- (UIView *)addTopLineWithOffset:(CGFloat)offset left:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height;

- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color;
- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color width:(CGFloat)width;
- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width height:(CGFloat)height;

- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color;
- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width;
- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width height:(CGFloat)height;

- (UIView *)addCenterDotLine;
@end


 
