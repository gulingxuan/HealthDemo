//
//  BaseNavigationController.m
//  WYFX_Demo
//
//  Created by 顾泠轩 on 16/12/20.
//  Copyright © 2016年 ChenDan. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UITabBarController+HideTabBar.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation BaseNavigationController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self setNeedsStatusBarAppearanceUpdate];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],
                                                 NSForegroundColorAttributeName:[UIColor whiteColor]
                                                 }];
    self.delegate = self;
}

#pragma mark- 导航控制器代理
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(navigationController.viewControllers.count>1){
        [viewController.tabBarController setTabBarHidden:YES];
    }else{
        [viewController.tabBarController setTabBarHidden:NO];
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [super popViewControllerAnimated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}





@end
