//
//  NSString+ColorString.m
//  
//
//  Created by  陈丹 on 2017/1/10.
//
//

#import "NSString+ColorString.h"

@implementation NSString (ColorString)

+ (NSAttributedString *)colorWithUpDownString:(NSString *)updownString{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if([updownString floatValue]-0<0){
        updownString = [NSString stringWithFormat:@"-%@",updownString];
        [dic setValue:RGBCOLOR(30, 181, 58) forKey:NSForegroundColorAttributeName];
    }else{
        [dic setValue:RGBCOLOR(220, 82, 74) forKey:NSForegroundColorAttributeName];
    }
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:updownString];
    return str;
}

+ (NSAttributedString *)colorWithBuySell:(NSString *)buySell{
    return nil;
}

@end
