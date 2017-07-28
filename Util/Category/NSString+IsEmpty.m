//
//  NSString+IsEmpty.m
//  WYFX_Demo
//
//  Created by 顾泠轩 on 16/12/27.
//  Copyright © 2016年 ChenDan. All rights reserved.
//

#import "NSString+IsEmpty.h"

@implementation NSString (IsEmpty)

-(BOOL)isEmpty
{
    
    if(self == nil || [self class] == [NSNull null]||[self isEqualToString:@""]||[self isEqualToString:@"null"])
    {
        return YES;
    }else
    {
        return NO;
    }
}
- (BOOL)isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
- (BOOL)checkMiMa

{
    
    NSString *regex = @"^[a-zA-Z0-9]{6,18}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    
    if (!isMatch)
        
    {
        
        return NO;
        
    }
    
    return YES;
}
- (BOOL)checkNiCheng

{
    
    NSString *regex = @"^[\\w\\\\u4e00-\\\\u9fa5_a-zA-Z0-9-]{2,16}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    
    if (!isMatch)
        
    {
        
        return NO;
        
    }
    
    return YES;
}
@end
