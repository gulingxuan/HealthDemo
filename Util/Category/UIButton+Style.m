//
//  UIButton+Style.m
//  WYFX_Demo
//
//  Created by 顾泠轩 on 16/12/21.
//  Copyright © 2016年 ChenDan. All rights reserved.
//

#import "UIButton+Style.h"

@implementation UIButton (Style)

-(void)setTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor selectTitleColor:(UIColor *)scolor backgroundColor:(UIColor *)backgroundColor
{
    if (title)
    {
        [self setTitle:title forState:UIControlStateNormal];
    }
    
    if(fontSize <5)
    {
        self.titleLabel.font = [UIFont systemFontOfSize:5];
    }
    else
    {
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    if(titleColor)
    {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (scolor)
    {
        [self setTitleColor:scolor forState:UIControlStateSelected];
    }
    if (backgroundColor)
    {
        self.backgroundColor = backgroundColor;
    }
    
    
}

-(void)setTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor selectTitleColor:(UIColor *)scolor backgroundColor:(UIColor *)backgroundColor image:(NSString *)imgName
{
    if (title)
    {
        [self setTitle:title forState:UIControlStateNormal];
    }
    
    if(fontSize <5)
    {
        self.titleLabel.font = [UIFont systemFontOfSize:5];
    }
    else
    {
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    if(titleColor)
    {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (scolor)
    {
        [self setTitleColor:scolor forState:UIControlStateSelected];
    }
    if (backgroundColor)
    {
        self.backgroundColor = backgroundColor;
    }
    if (imgName)
    {
        [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    
}

@end
