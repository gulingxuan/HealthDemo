//
//  BooksViewController.m
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/28.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "BooksViewController.h"
#import "HomePageViewController.h"
#import "TMControlManagerViewController.h"
#import <MMDrawerController.h>
#import "TMSideViewController.h"
#import "Const.h"
@interface BooksViewController ()

@end

@implementation BooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账本";
    self.view.backgroundColor = [UIColor whiteColor];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    TMControlManagerViewController *controlManageVC = [[TMControlManagerViewController alloc] init];
    UINavigationController *controlManagerVCNV = [[UINavigationController alloc] initWithRootViewController:controlManageVC];
    
    TMSideViewController *sideVC = [[TMSideViewController alloc] init];
    
    MMDrawerController *drawerController = [[MMDrawerController alloc] initWithCenterViewController:controlManagerVCNV leftDrawerViewController:sideVC];
    /** 设置打开/关闭抽屉的手势 */
    drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    drawerController.closeDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    drawerController.showsShadow = NO;
    /** 设置左边抽屉显示的多少 */
    drawerController.maximumLeftDrawerWidth = SCREEN_SIZE.width - 50;
    window.rootViewController = drawerController;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
