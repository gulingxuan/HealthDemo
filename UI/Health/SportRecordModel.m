//
//  SportRecordModel.m
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/8/7.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "SportRecordModel.h"

@implementation SportRecordModel

-(NSString *)description
{
    return [NSString stringWithFormat:@"\r year = %@, month = %@, day = %@, setupNum = %@",self.year,self.month,self.day,self.setupNum];
}



@end
