//
//  HealthViewModel.h
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/28.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "BaseViewModel.h"
#import "HealthView.h"

@interface HealthViewModel : BaseViewModel
@property (nonatomic, strong) HealthView *healthView;
@property (nonatomic, strong) NSString *startDate;//开始运动的日期
@property (nonatomic, copy) NSString *setupNumber;//步数
@property (nonatomic, copy) NSString *distanceNumber;//距离

//刷新运动数据
-(void)refreshData;
//截屏
-(UIImage *)captureImageFromView:(UIView *)view;
@end
