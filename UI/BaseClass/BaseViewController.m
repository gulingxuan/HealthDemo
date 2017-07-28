//
//  BaseViewController.m
//  BaseDemo
//
//  Created by 顾泠轩 on 2017/6/21.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}



#pragma mark -- set / get



#pragma mark -- 数据加载




#pragma mark -- UI
-(void)createUI
{
    
}

//设置title
-(void)setNavTitle:(NSString *)title{
    self.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

//设置导航
-(void)setNavBackground
{
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = RGBCOLOR(35, 38, 47);
}

//设置返回按钮
- (void)setupNavBackButton
{
    UIImage* img1=[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem*barItem1 = [[UIBarButtonItem alloc]
                                initWithImage:img1
                                style:UIBarButtonItemStylePlain
                                target:self
                                action:@selector(goBackAction)];
    self.navigationItem.leftBarButtonItem = barItem1;
}

//设置导航右键
- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title {
    [self createNavigationBarRightBarButtonItemWithTitle:title style:UIBarButtonItemStylePlain];
}
- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style {
    [self createNavigationBarRightBarButtonItemWithTitle:title style:style target:self action:@selector(rightAction)];
}

- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
    //这个可以简单的理解为特殊的按钮，不需要我们去考虑布局，只要实现样式和内容，系统为我们进行布局。
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTintColor:[UIColor grayColor]];
    [button setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:button];;
    self.navigationItem.rightBarButtonItem = right;
    
}

#pragma mark -- 点击事件
//返回
- (void)goBackAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

//右键响应方法
- (void)rightAction
{
    
}



#pragma mark --逻辑处理




@end
