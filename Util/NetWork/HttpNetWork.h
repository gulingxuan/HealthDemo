//
//  HttpNetWork.h
//  TestDemo
//
//  Created by 顾泠轩 on 17/4/1.
//  Copyright © 2017年 glx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpNetWork : NSObject
//检测网络状态
+ (void)netWorkStatus:(void (^)(id))block;

//获取K线数据
+(void)getKLimeDataWithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block;

//get 请求
+ (void)getDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block;
//GET 非Json请求
+ (void)getNotJsonDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block;
//Json POST Raw 添加请求头
+(void)JSONPostRawWithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block;

//Json POST Raw 添加请求头 -- 交易请求
+(void)tradeJSONPostRawWithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block;

//获取版本信息
+(void)getNewVersionWithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block;

@end
