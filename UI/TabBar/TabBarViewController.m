//
//  TabBarViewController.m
//  WYFX_Demo
//
//  Created by 顾泠轩 on 16/12/20.
//  Copyright © 2016年 ChenDan. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseViewController.h"
#import "BaseNavigationController.h"



@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

-(void)createUI
{
    
    NSArray *arr = @[@"HealthViewController",@"RecordViewController",@"BooksViewController"];
    NSMutableArray *mArr = [NSMutableArray array];
    for (int i = 0; i < arr.count; i++)
    {
            Class class =NSClassFromString(arr[i]);
            BaseViewController *bvc = [[class alloc]init];
            BaseNavigationController *nvc = [[BaseNavigationController alloc]initWithRootViewController:bvc];
            [mArr addObject:nvc];

    }
    self.viewControllers = mArr;
    NSArray *imgArr = @[@"movement",@"record",@"mine"];
    NSArray *titleArr = @[@"运动",@"记录",@"账本"];
    
    for (int i = 0; i < titleArr.count; i++)
    {
        UITabBarItem *item = self.tabBar.items[i];
        item.title = titleArr[i];
        self.tabBar.tintColor=RGBCOLOR(179, 219, 158);
        item.image = [[UIImage imageNamed:imgArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        item.selectedImage = [[UIImage imageNamed:[imgArr[i] stringByAppendingString:@"S"]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    self.selectedIndex = 0;

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
