//
//  UIAlertController+CustomAlert.m
//  YuBao
//
//  Created by hok on 10/11/15.
//  Copyright © 2015 hok. All rights reserved.
//

#import "UIAlertController+CustomAlert.h"

@implementation UIAlertController (CustomAlert)

+ (UIAlertController *)alertWithTitle: (NSString *)title andMessage:(NSString *)message andBlock:(void (^)(UIAlertAction *action))block type:(NSString *)type{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:block];
    [alertController addAction:okAction];
    if([type isEqualToString:@"confirmAndCancel"]){
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:block];
        [alertController addAction:cancelAction];
    }
    return alertController;
    //[self presentViewController:alertController animated:YES completion:nil];
    
}
+ (UIAlertController *)alertWithNoBankCardTitle: (NSString *)title andMessage:(NSString *)message andBlock:(void (^)(UIAlertAction *action))block type:(NSString *)type
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:block];
    [alertController addAction:okAction];
    if([type isEqualToString:@"confirmAndCancel"]){
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"再看看" style:UIAlertActionStyleCancel handler:block];
        [alertController addAction:cancelAction];
    }
    return alertController;
}

@end
