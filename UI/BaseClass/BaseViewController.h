//
//  BaseViewController.h
//  BaseDemo
//
//  Created by 顾泠轩 on 2017/6/21.
//  Copyright © 2017年 glx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void)createUI;

- (void)setupNavBackButton;
//返回响应方法
- (void)goBackAction;
//右键响应方法
- (void)rightAction;

//导航右键
- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title;

/*
 设置title
 */
-(void)setNavTitle:(NSString *)title;

//设置导航
-(void)setNavBackground;

@end
