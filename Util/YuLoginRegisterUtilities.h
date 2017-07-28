//
//  YuLoginRegisterUtilities.h
//  HuLaQuan
//
//  Created by hok on 1/6/16.
//  Copyright © 2016 Jianghao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YuLoginRegisterUtilities : NSObject

+ (BOOL)isValidateEmail:(NSString *)email;

+ (BOOL)isMobileNumber:(NSString *)mobileNum;

+ (BOOL)isPasswordValid:(NSString *)pwNum;

// 6-12位数字及字母密码
+(BOOL)isNumAndAlphabetPassword:(NSString *)pwStr;

@end
