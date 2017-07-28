//
//  NetWorkHeader.h
//  WYFX_Demo
//
//  Created by 顾泠轩 on 16/12/21.
//  Copyright © 2016年 ChenDan. All rights reserved.
//

#ifndef NetWorkHeader_h
#define NetWorkHeader_h
#endif

//ERROR MESSAGE
#define TEXT_NETWORK_ERROR @"网络异常，请检查网络连接"
#define TEXT_SERVER_NOT_RESPOND @"服务器或网络异常,请稍后重试"

#define Request_Success_Code @"I001"

#define Request_TokenInvaid_Code 000001

#define Request_Failure_Code 000001

#define BaseINHttp(baseUrl) [NSString stringWithFormat:@"http://106.14.159.201:8080%@",(baseUrl)]

/**************控制不同环境下使用的url****************/

//0:测试环境   1:外网正式环境

#define URL_CONDITION_FLAG 1

#if URL_CONDITION_FLAG == 0 //测试链接



#elif URL_CONDITION_FLAG == 1 //正式链接


#endif /* NetWorkHeader_h */












