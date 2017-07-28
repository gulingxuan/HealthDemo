//
//  HealthView.h
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/28.
//  Copyright © 2017年 glx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthView : UIView
@property (nonatomic, strong) UILabel *curSetupLabel;//当前步数
@property (nonatomic, strong) UILabel *curDistanceLabel;//当前公里数
@property (nonatomic, strong) UILabel *resultSetupLabel;//步数结果
@property (nonatomic, strong) UILabel *resultDistanceLabel;//距离结果

@property (nonatomic, strong) RACSubject *runSubject;//点击运动按钮

@end
