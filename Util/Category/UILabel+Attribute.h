//
//  UILabel+Attribute.h
//  WYFX_Demo
//
//  Created by 顾泠轩 on 17/1/6.
//  Copyright © 2017年 ChenDan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Attribute)

//富文本
-(void)setAttributeTitle:(NSString *)str titleColor:(UIColor *)titleColor textAlignment:(NSTextAlignment)textAlignment fontSize:(CGFloat)size range:(NSRange)range  attributeSize:(CGFloat)aSize attributeColor:(UIColor *)aColor;

@end
