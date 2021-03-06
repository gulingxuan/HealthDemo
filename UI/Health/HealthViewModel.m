//
//  HealthViewModel.m
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/28.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "HealthViewModel.h"

#import "HealthKitManage.h"

@interface HealthViewModel()
@property (nonatomic, assign) BOOL running;
@property (nonatomic, copy) NSString *endSetup;//结束运动时的步数
@property (nonatomic, copy) NSString *endDistance;//结束是的距离

@end

@implementation HealthViewModel
@synthesize setupNumber = _setupNumber;
@synthesize distanceNumber = _distanceNumber;
@synthesize startDate = _startDate;



- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bindView];
        self.running = ![self.healthView.btnString isEqualToString:@"开始运动"];
        //注册通知,从后台进入App时刷新数据，Appdelegate发出通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:SPORT_DATA_REFRESH object:nil];
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark --Bind
-(void)bindView
{
    //点击开始运动/结束运动
    [self exchangeSportMode];
}

//运动模式切换
-(void)exchangeSportMode
{
    [self.healthView.runSubject subscribeNext:^(id  _Nullable x) {
        if ([x boolValue])//点击开始运动
        {
            self.startDate = [self getCurDate];
            HealthKitManage *manage = [HealthKitManage shareInstance];
            //步数
            [manage authorizeHealthKit:^(BOOL success, NSError *error) {
                
                if (success) {
                    NSLog(@"success");
                    [manage getStepCount:^(double value, NSError *error) {
                        NSLog(@"1count-->%.0f", value);
                        NSLog(@"1error-->%@", error.localizedDescription);
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.healthView.curSetupLabel.text = [NSString stringWithFormat:@"%.0f步", value];
                            self.healthView.resultSetupLabel.text = @"0";
                            self.setupNumber = [NSString stringWithFormat:@"%.0f", value];
                        });
                        
                    }];
                }
                else {
                    NSLog(@"fail");
                }
            }];
            
            //距离
            [manage authorizeHealthKit:^(BOOL success, NSError *error) {
                
                if (success) {
                    NSLog(@"success");
                    [manage getDistance:^(double value, NSError *error) {
                        NSLog(@"2count-->%.2f", value);
                        NSLog(@"2error-->%@", error.localizedDescription);
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.healthView.curDistanceLabel.text = [NSString stringWithFormat:@"%.2f公里", value];
                            self.healthView.resultDistanceLabel.text = @"0";
                            self.distanceNumber = [NSString stringWithFormat:@"%.2f", value];
                        });
                    }];
                }
                else {
                    NSLog(@"fail");
                }
            }];
            
        }
        else//结束运动,保存数据
        {
            self.endSetup = self.healthView.curSetupLabel.text;
            self.endSetup = self.healthView.curDistanceLabel.text;
        }
        self.running = [x boolValue];
        
    }];
}




#pragma mark -- set / get
-(HealthView *)healthView
{
    if (!_healthView)
    {
        _healthView = [[HealthView alloc]initWithFrame:CGRectMake(0, 64, SCW, SCH - 108)];
    }
    return _healthView;
}

-(NSString *)setupNumber
{
    if (!_setupNumber)
    {
        _setupNumber = UserDefaultObjectForKey(@"setupNumber");
    }
    return _setupNumber;
}

-(void)setSetupNumber:(NSString *)setupNumber
{
    _setupNumber = setupNumber;
    UserDefaultSetObjectForKey(_setupNumber, @"setupNumber");
}

-(NSString *)distanceNumber
{
    if (!_distanceNumber)
    {
        _distanceNumber = UserDefaultObjectForKey(@"distanceNumber");
    }
    return _distanceNumber;
}

-(void)setDistanceNumber:(NSString *)distanceNumber
{
    _distanceNumber = distanceNumber;
    UserDefaultSetObjectForKey(_distanceNumber, @"distanceNumber");
}

-(NSString *)startDate
{
    if (!_startDate)
    {
        _startDate = UserDefaultObjectForKey(@"startDate");
    }
    return _startDate;
}




#pragma mark -- 数据加载




#pragma mark -- UI




#pragma mark -- 点击事件




#pragma mark --逻辑处理
//刷新步数
-(void)refreshData
{
    if (self.startDate)
    {
        NSString *curDate = [self getCurDate];
        if (![self.startDate isEqualToString:curDate])
        {
            self.setupNumber = nil;
            self.distanceNumber = nil;
        }
    }
    else
    {
        self.setupNumber = nil;
        self.distanceNumber = nil;
    }
    
    HealthKitManage *manage = [HealthKitManage shareInstance];
    
    @Weak(self)
    //刷新步数
    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        @Strong(self)
        if (success) {
            NSLog(@"success");
            [manage getStepCount:^(double value, NSError *error) {
                NSLog(@"1count-->%.0f", value);
                NSLog(@"1error-->%@", error.localizedDescription);
                dispatch_async(dispatch_get_main_queue(), ^{
                    //今日总步数
                    self.healthView.curSetupLabel.text = [NSString stringWithFormat:@"%.0f步", value];
                    //存在起始步数才进行计算运动步数
                    if(self.setupNumber)
                    {
                        //开始运动时的起始步数
                        CGFloat startSetup = [self.setupNumber floatValue];
                        //处于运动模式才进行步数计算
                        if (self.running)
                        {
                            self.healthView.resultSetupLabel.text = value>startSetup?[NSString stringWithFormat:@"%.0f步",value-startSetup] : @"0步";
                        }
                        
                    }
                    else
                    {
                        self.healthView.resultSetupLabel.text = @"0步";
                    }
                    
                });
                
            }];
        }
        else {
            NSLog(@"fail");
        }
    }];
    
    //刷新距离

    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        
        if (success) {
            NSLog(@"success");
            [manage getDistance:^(double value, NSError *error) {
                NSLog(@"2count-->%.2f", value);
                NSLog(@"2error-->%@", error.localizedDescription);
                dispatch_async(dispatch_get_main_queue(), ^{
                    //今日总距离
                    self.healthView.curDistanceLabel.text = [NSString stringWithFormat:@"%.2f公里", value];
                    //存在起始距离才进行计算今日距离
                    if (self.distanceNumber)
                    {
                        //开始运动时的起始距离
                        CGFloat startDistance = [self.distanceNumber floatValue];
                        //处于运动状态才进行距离计算
                        if (self.running)
                        {
                            self.healthView.resultDistanceLabel.text = value > startDistance ? [NSString stringWithFormat:@"%.2f公里",value -  startDistance] : @"0公里";
                        }
                    }
                    else
                    {
                        self.healthView.resultDistanceLabel.text = @"0公里";
                    }
                });
            }];
        }
        else {
            NSLog(@"fail");
        }
    }];

    
}

//获取当前时间
-(NSString *)getCurDate
{
    NSDate *date =[NSDate date];//简书 FlyElephant
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    NSString *dateStr = [NSString stringWithFormat:@"%ld-%ld-%ld",currentYear,currentMonth,currentDay];
    return dateStr;
}

#pragma mark --截图

//截图功能

-(UIImage *)captureImageFromView:(UIView *)view

{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
    
}



@end
