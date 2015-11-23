//
//  userModel.m
//  BaseProject
//
//  Created by tarena on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
+(NSArray *)user
{
    //从数据库中获取 t_kind 表中所有数据
    FMDatabase *db = [self defaultDatabase];
    //搜索表中所有内容
    FMResultSet *rs = [db executeQuery:@"select * from user"];
    //创建可变数组 存储检索出的数据
    NSMutableArray *dataArr = [NSMutableArray new];
    while ([rs next]) {
        UserModel *model = [self new];
        model.userName =[rs stringForColumn:@"userName"];
        model.passWord = [rs stringForColumn:@"passWord"];
        model.image = [rs stringForColumn:@"image"];
        [dataArr addObject:model];
    }
    //释放掉搜索出来的内容
    [db closeOpenResultSets];
    //关闭数据库
    [db close];
    return [dataArr copy];
}
+(NSArray *)userListWithUserName:(NSString *)userName andPassWord:(NSString *)passWord
{
    FMDatabase *db = [self defaultDatabase];
    //如果数据库语句需要传参 👇
    FMResultSet *rs = [db executeQueryWithFormat:@"select * from user where userName = %@ and passWord = %@",userName,passWord];
        NSMutableArray *dataArr = [NSMutableArray new];
        while ([rs next]) {
            UserModel *model = [self new];
            model.userName = [rs stringForColumn:@"userName"];
            model.passWord = [rs stringForColumn:@"passWord"];
            [dataArr addObject:model];
        }
        [db closeOpenResultSets];
        [db close];
        return [dataArr copy];
}
-(BOOL)addUserWithUserName:(NSString *)userName PassWord:(NSString *)passWord Image:(NSString *)image
{
    FMDatabase *db = [UserModel defaultDatabase];
    BOOL success = [db executeUpdateWithFormat:@"insert into user values ('%@', '%@' ,'%@')",userName,passWord,image];
    [db close];
    return success;
}
@end
