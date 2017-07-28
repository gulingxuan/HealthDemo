//
//  NSString+ColorString.h
//  
//
//  Created by  陈丹 on 2017/1/10.
//
//

#import <Foundation/Foundation.h>

@interface NSString (ColorString)

+ (NSAttributedString *)colorWithUpDownString:(NSString *)updownString;

+ (NSAttributedString *)colorWithBuySell:(NSString *)buySell;

@end
