//
//  HttpNetWork.m
//  TestDemo
//
//  Created by 顾泠轩 on 17/4/1.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "HttpNetWork.h"
#import <AFNetworking/AFNetworking.h>

@implementation HttpNetWork




//不添加请求头的 Manager
+(AFHTTPSessionManager *)shareSessionManager
{
    static AFHTTPSessionManager *manager = nil;
    if (!manager)
    {
        manager = [AFHTTPSessionManager manager];
        // 设置超时时间
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = 20.f;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

    }
    return manager;
}

//添加请求头的 Manager
+(AFHTTPSessionManager *)shareRowSessionManager
{
    static AFHTTPSessionManager *manager = nil;
    if (!manager)
    {
        manager = [AFHTTPSessionManager manager];
        // 设置超时时间
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = 20.f;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        
        //添加请求头
        [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [manager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
    }
    return manager;
}

//检测网络状态
+ (void)netWorkStatus:(void (^)(id))block
{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //NSLog(@"%ld", status);
        block([NSString stringWithFormat:@"%ld",(long)status]);
        
    }];
}


//获取K线数据
+(void)getKLimeDataWithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block
{
    AFHTTPSessionManager *manager = [HttpNetWork shareSessionManager];
    [manager GET:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        !block ? : block(YES,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error description]);
        block(NO,error);
    }];
}


//GET 请求
+ (void)getDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block
{
    AFHTTPSessionManager *manager = [HttpNetWork shareSessionManager];
    
    [manager GET:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(YES,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block(NO,error);
    }];
    
}
//GET 非Json请求
+ (void)getNotJsonDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block
{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(YES,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block(NO,error);
    }];
    
}
//POST 请求
+ (void)postDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block
{
    AFHTTPSessionManager *manager = [HttpNetWork shareSessionManager];
    
    [manager POST:url parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(YES,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error description]);
        block(NO,error);
    }];
    
}

//Json POST Raw 添加请求头
+(void)JSONPostRawWithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block
{
    
    AFHTTPSessionManager *manager = [HttpNetWork shareRowSessionManager];
    [manager POST:urlStr parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(YES,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",[error description]);
        block(NO,error);
        
        
    }];
    
}


//Json POST Raw 添加请求头 -- 交易请求
+(void)tradeJSONPostRawWithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block
{
    
    AFHTTPSessionManager *manager = [HttpNetWork shareRowSessionManager];
    [manager POST:urlStr parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"ResultCD"] isEqualToString:Request_Success_Code] && ![responseObject[@"ErrorMsg"] isEqual:[NSNull null]])
        {
            NSDictionary *dic = @{@"result":@"sucess",@"data":responseObject};
            block(YES,dic);
        }
        else
        {
            NSDictionary * dic=@{@"result":@"123",@"msg":responseObject};
            block(YES,dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error description]);
        block(NO,error);
    }];
    
}

//获取版本信息
+(void)getNewVersionWithUrl:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(BOOL isSuccess, id item))block
{
    AFHTTPSessionManager *manager = [HttpNetWork shareSessionManager];
    [manager GET:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(YES,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error description]);
        block(NO,error);
    }];
}

@end








