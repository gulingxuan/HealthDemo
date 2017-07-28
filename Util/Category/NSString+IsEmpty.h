//
//  NSString+IsEmpty.h
//  WYFX_Demo
//
//  Created by 顾泠轩 on 16/12/27.
//  Copyright © 2016年 ChenDan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IsEmpty)
//判断字符串是否为空
-(BOOL)isEmpty;
//判断是不是整数
- (BOOL)isPureInt;
//密码判断
- (BOOL)checkMiMa;
//判断昵称
- (BOOL)checkNiCheng;
@end
