//
//  UIView+CPFrame.m
//  CP_Category
//
//  Created by lk03 on 17/5/18.
//  Copyright © 2017年 KKJY. All rights reserved.
//

#import "UIView+CPFrame.h"
#import <SDAutoLayout/SDAutoLayout.h>

@implementation UIView (CPFrame)

- (void)setCP_Width:(CGFloat)CP_Width{
    CGRect rect = self.frame;
    rect.size.width = CP_Width;
    self.frame = rect;
}

- (CGFloat)CP_Width{
    return self.frame.size.width;
}

- (void)setCP_Height:(CGFloat)CP_Height{
    CGRect rect = self.frame;
    rect.size.height = CP_Height;
    self.frame = rect;
}

- (CGFloat)CP_Height{
    return self.frame.size.height;
}

- (void)setCP_X:(CGFloat)CP_X{
    CGRect rect = self.frame;
    rect.origin.x = CP_X;
    self.frame = rect;
}

- (CGFloat)CP_X{
    return self.frame.origin.x;
}

- (void)setCP_Y:(CGFloat)CP_Y{
    CGRect rect = self.frame;
    rect.origin.y = CP_Y;
    self.frame = rect;
}

- (CGFloat)CP_Y{
    return self.frame.origin.y;
}

- (void)setCP_CenterX:(CGFloat)CP_CenterX{
    CGPoint p = self.center;
    p.x = CP_CenterX;
    self.center = p;
}

- (CGFloat)CP_CenterX{
    return self.center.x;
}

- (void)setCP_CenterY:(CGFloat)CP_CenterY{
    CGPoint p = self.center;
    p.y = CP_CenterY;
    self.center = p;
}

- (CGFloat)CP_CenterY{
    return self.center.y;
}

- (CGFloat)CP_right{
    return self.CP_X + self.CP_Width;
}

- (CGFloat)CP_bottom{
    return self.CP_Y + self.CP_Height;
}

- (void)setCP_right:(CGFloat)CP_right{
    self.CP_X = CP_right - self.CP_Width;
}

- (void)setCP_bottom:(CGFloat)CP_bottom{
    self.CP_Y = CP_bottom - self.CP_Height;
}
@end

@implementation UIView (line)

- (UIView *)addBottomLineWithOffset:(CGFloat)offset color:(UIColor *)color
{
    return [self addBottomLineWithOffset:offset color:color height:0.5];
}

- (UIView *)addBottomLineWithOffset:(CGFloat)offset color:(UIColor *)color height:(CGFloat)height
{
    return [self addBottomLineWithOffset:offset left:0 right:0 color:color height:height];
}

- (UIView *)addBottomLineWithOffset:(CGFloat)offset left:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    
    line.sd_layout.rightEqualToView(self).offset(-right).leftEqualToView(self).offset(left).heightIs(height).bottomSpaceToView(self, offset);
    return line;
}

- (UIView *)addTopLineWithOffset:(CGFloat)offset color:(UIColor *)color
{
    return [self addTopLineWithOffset:offset color:color height:0.5];
}

- (UIView *)addTopLineWithOffset:(CGFloat)offset color:(UIColor *)color height:(CGFloat)height
{
    return [self addTopLineWithOffset:offset left:0 right:0 color:color height:height];
}

- (UIView *)addTopLineWithOffset:(CGFloat)offset left:(CGFloat)left right:(CGFloat)right color:(UIColor *)color height:(CGFloat)height
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
    {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.rightSpaceToView(self, right).leftSpaceToView(self, left).heightIs(height).topSpaceToView(self, offset);
    return line;
}

- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color
{
    return [self addLeftLineWithOffset:offset color:color width:0.5];
}

- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.topEqualToView(self).bottomEqualToView(self).leftSpaceToView(self, offset).widthIs(width);
    return line;
}

- (UIView *)addLeftLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width height:(CGFloat)height
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.centerYEqualToView(self).heightIs(height).leftSpaceToView(self, offset).widthIs(width);
    return line;
}


- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color
{
    return [self addRightLineWithOffset:offset color:color width:0.5];
}

- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.topEqualToView(self).bottomEqualToView(self).rightSpaceToView(self, offset).widthIs(width);
    return line;
}

- (UIView *)addRightLineWithOffset:(CGFloat)offset color:(UIColor *)color  width:(CGFloat)width height:(CGFloat)height
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.centerYEqualToView(self).heightIs(height).rightSpaceToView(self, offset).widthIs(width);
    return line;
}

- (UIView *)addCenterDotLine{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor clearColor];
    if ([self isKindOfClass:[UIVisualEffectView class]])
        {
        UIVisualEffectView *view = (UIVisualEffectView *)self;
        [view.contentView addSubview:line];
    }else{
        [self addSubview:line];
    }
    line.sd_layout.centerXEqualToView(self).centerYEqualToView(self).widthIs(1).heightIs(1);
    return line;
}

@end


 
