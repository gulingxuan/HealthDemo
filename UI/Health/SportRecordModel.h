//
//  SportRecordModel.h
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/8/7.
//  Copyright © 2017年 glx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SportRecordModel : NSObject
@property (nonatomic, assign) NSInteger recordId;//id号
@property (nonatomic, copy) NSString *year;//年
@property (nonatomic, copy) NSString *month;//月
@property (nonatomic, copy) NSString *day;//日
@property (nonatomic, copy) NSString *time;//具体时间
@property (nonatomic, copy) NSString *distanceNum;//距离
@property (nonatomic, copy) NSString *setupNum;//步数



@end
