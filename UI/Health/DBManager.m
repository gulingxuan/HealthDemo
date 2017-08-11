//
//  DBManager.m
//  StorageDemo
//
//  Created by 文艺复兴 on 2017/8/11.
//  Copyright © 2017年 顾泠轩. All rights reserved.
//

#import "DBManager.h"
#import <FMDB.h>

@interface DBManager()

@property (nonatomic, strong) FMDatabase *dataBase;

@end

@implementation DBManager

//创建DB单例对象
+(DBManager *)shareManager
{
    static DBManager *mgr;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [[DBManager alloc]init];
    });
    return mgr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //创建数据库，
        [self createDataBase];
    }
    return self;
}

//创建并打开数据库，打开成功后将新建SportRecord表
-(void)createDataBase
{
    //数据库路径
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *path = [documentPath stringByAppendingPathComponent:@"SportRecord.sqlite"];
    //初始化数据库
    self.dataBase = [[FMDatabase alloc]initWithPath:path];
    if (![self.dataBase open])//打开数据库失败
    {
        NSLog(@"打开数据库失败");
    }
    else//打开数据库成功。如果数据库不存在，将创建数据库并打开
    {
        //创建表，如果表不存在则创建；存在着不创建
        BOOL creatTable = [self.dataBase executeUpdate:@"create table if not exists SportRecord (recordId integer primary key autoincrement,year text,month text,day text,time text,distanceNum text,setupNum text);"];
        if (!creatTable)
        {
            NSLog(@"创建表失败");
        }
    }
}

//插入model对象
-(void)insertSportRecordModel:(SportRecordModel *)model
{
    if (![self.dataBase executeUpdate:@"insert into SportRecord (year,month,day,time,distanceNum,setupNum) values(?,?,?,?,?,?);",model.year,model.month,model.day,model.time,model.distanceNum,model.setupNum])
    {
        NSLog(@"添加对象失败！");
    }
    
}

//删除model对象
-(void)deleteSportRecordModel:(SportRecordModel *)model
{
    //根据年月日时间及步数等信息，删除数据
    if (![self.dataBase executeUpdate:@"delete from SportRecord where year=? and month=? and day=? and time=? and setupNum=?;",model.year,model.month,model.day,model.time,model.setupNum])
    {
        NSLog(@"删除对象失败");
    }
}

//获取全部数据
-(NSArray *)selectSportRecordModels
{
    FMResultSet *set = [self.dataBase executeQuery:@"select * from SportRecord"];
    NSMutableArray *arr = [NSMutableArray array];
    while ([set next])
    {
        SportRecordModel *model = [[SportRecordModel alloc]init];
        model.year = [set stringForColumn:@"year"];
        model.month = [set stringForColumn:@"month"];
        model.day = [set stringForColumn:@"day"];
        model.time = [set stringForColumn:@"time"];
        model.distanceNum = [set stringForColumn:@"distanceNum"];
        model.setupNum = [set stringForColumn:@"setupNum"];
        [arr addObject:model];
    }
    return arr;
}

//根据年月获取model数据
-(NSArray *)selectSportRecordModelsWithYear:(NSString *)year month:(NSString *)month
{
    NSMutableArray *arr = [NSMutableArray array];
    FMResultSet *set = [self.dataBase executeQuery:@"select * from SportRecord where year=? and month=?",year,month];
    while ([set next])
    {
        SportRecordModel *model = [[SportRecordModel alloc]init];
        model.year = [set stringForColumn:@"year"];
        model.month = [set stringForColumn:@"month"];
        model.day = [set stringForColumn:@"day"];
        model.time = [set stringForColumn:@"time"];
        model.distanceNum = [set stringForColumn:@"distanceNum"];
        model.setupNum = [set stringForColumn:@"setupNum"];
        [arr addObject:model];
    }
    return arr;
}

@end
