//
//  YuLoginRegisterUtilities.m
//  HuLaQuan
//
//  Created by hok on 1/6/16.
//  Copyright © 2016 Jianghao. All rights reserved.
//

#import "YuLoginRegisterUtilities.h"

@implementation YuLoginRegisterUtilities

/**
 *  Check Email String Valid
 *
 *  @param email
 *
 *  @return email string is valid or not
 */
+ (BOOL) isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/**
 *  Check Mobile Number String
 *
 *  @param mobileNum
 *
 *  @return mobile number is valid or not
 */

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length > 0) {
        //   NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
        NSString * MOBILE = @"^((13[0-9])|(14[0-9])|(15[0-9])|(18[0-9])|(17[0-9]))\\d{8}$";
        
        NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
        NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
        NSString * CT = @"^1((77|33|53|8[09])[0-9]|349)\\d{7}$";
        // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
        NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
        NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
        NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
        NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
        if (([regextestmobile evaluateWithObject:mobileNum] == YES)
            || ([regextestcm evaluateWithObject:mobileNum] == YES)
            || ([regextestct evaluateWithObject:mobileNum] == YES)
            || ([regextestcu evaluateWithObject:mobileNum] == YES))
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    return NO;
    
}

/**
 *  Check Password String
 *
 *  @param pwNum
 *
 *  @return password string is consist of A-Z and # or not
 */
+ (BOOL)isPasswordValid:(NSString *)pwNum
{
    // secretNum
    if (pwNum.length > 5 && pwNum.length < 16) {
        BOOL res = YES;
        NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.?!"];
        int i = 0;
        while (i < pwNum.length) {
            NSString * string = [pwNum substringWithRange:NSMakeRange(i, 1)];
            NSRange range = [string rangeOfCharacterFromSet:tmpSet];
            if (range.length == 0) {
                res = NO;
                break;
            }
            i++;
        }
        return res;
    }
    return NO;
    
    
}

+(BOOL)isNumAndAlphabetPassword:(NSString *)pwStr
{
    
    //6-12位数字和字母组成-必须包含数字和密码
    //NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$";
    //6-12位数字或字母密码
    NSString *regex = @"^[a-zA-Z0-9]{6,12}$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:pwStr]) {
        return YES ;
    }else
        return NO;
}

@end
