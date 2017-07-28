//
//  UILabel+Attribute.m
//  WYFX_Demo
//
//  Created by 顾泠轩 on 17/1/6.
//  Copyright © 2017年 ChenDan. All rights reserved.
//

#import "UILabel+Attribute.h"

@implementation UILabel (Attribute)

//富文本
-(void)setAttributeTitle:(NSString *)str titleColor:(UIColor *)titleColor textAlignment:(NSTextAlignment)textAlignment fontSize:(CGFloat)size range:(NSRange)range  attributeSize:(CGFloat)aSize attributeColor:(UIColor *)aColor
{
    self.textColor = titleColor;
    self.textAlignment = textAlignment;

    if (3<size)
    {
        self.font = [UIFont systemFontOfSize:size];
    }
    
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    if (3<aSize)
    {
        [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:aSize] range:range];
    }
    if (aColor) {
        [attributedStr addAttribute:NSForegroundColorAttributeName value:aColor range:range];
    }
    self.attributedText = attributedStr;
}

@end
