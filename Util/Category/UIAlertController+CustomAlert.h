//
//  UIAlertController+CustomAlert.h
//  YuBao
//
//  Created by hok on 10/11/15.
//  Copyright © 2015 hok. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^AlertBlock)(UIAlertAction *action);

@interface UIAlertController (CustomAlert)
+ (UIAlertController *)alertWithTitle: (NSString *)title andMessage:(NSString *)message andBlock:(void (^)(UIAlertAction *action))block type:(NSString *)type;


+ (UIAlertController *)alertWithNoBankCardTitle: (NSString *)title andMessage:(NSString *)message andBlock:(void (^)(UIAlertAction *action))block type:(NSString *)type;

@end
