//
//  DBManager.h
//  StorageDemo
//
//  Created by 文艺复兴 on 2017/8/11.
//  Copyright © 2017年 顾泠轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SportRecordModel.h"

@interface DBManager : NSObject

//数据库单例
+(DBManager *)shareManager;

//插入model对象
-(void)insertSportRecordModel:(SportRecordModel *)model;

//删除model对象
-(void)deleteSportRecordModel:(SportRecordModel *)model;

//获取全部数据
-(NSArray *)selectSportRecordModels;

//根据年月获取model数据
-(NSArray *)selectSportRecordModelsWithYear:(NSString *)year month:(NSString *)month;

@end





