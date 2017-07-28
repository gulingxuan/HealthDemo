//
//  HealthKitManage.h
//  iOSHealthDemo
//
//  Created by 快递兔 on 2017/6/5.
//  Copyright © 2017年 快递兔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>
#import <UIKit/UIDevice.h>

#define HKVersion [[[UIDevice currentDevice] systemVersion] doubleValue]
#define CustomHealthErrorDomain @"com.sdqt.healthError"

@interface HealthKitManage : NSObject

+(id)shareInstance;

- (void)authorizeHealthKit:(void(^)(BOOL success, NSError *error))compltion;

- (void)getStepCount:(void(^)(double value, NSError *error))completion;

- (void)getDistance:(void(^)(double value, NSError *error))completion;

@property (nonatomic, strong) HKHealthStore *healthStore;

@end
