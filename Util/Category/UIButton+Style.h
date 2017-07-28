//
//  UIButton+Style.h
//  WYFX_Demo
//
//  Created by 顾泠轩 on 16/12/21.
//  Copyright © 2016年 ChenDan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Style)

-(void)setTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor selectTitleColor:(UIColor *)scolor backgroundColor:(UIColor *)backgroundColor;

-(void)setTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor selectTitleColor:(UIColor *)scolor backgroundColor:(UIColor *)backgroundColor image:(NSString *)imgName;

@end
