//
//  WeekDetailViewModel.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WeekDetailViewModel.h"

@implementation WeekDetailViewModel
-(instancetype)initWithId:(NSString *)ID
{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}
-(instancetype)init
{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用 initWithId 来初始化", __func__);
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [XiaChuFangNetManager getWeekDetailWithId:self.ID completionHandle:^(WeekDetailContentModel *model, NSError *error) {
        if (!error) {
            self.dataArr = [model.recipes copy];
            completionHandle(error);
        }
    }];
}
- (WeekDetailContentRecipesModel *)modelForRowInRecipes:(NSInteger)row
{
    return self.dataArr[row];
}
- (WeekDetailContentRecipesInstructionAuthorModel *)modelForRowInAuthor:(NSInteger)row
{
    return [self modelForRowInRecipes:row].author;
}
- (WeekDetailContentRecipesInstructionStatsModel *)modelForRowInStats:(NSInteger)row
{
    return [self modelForRowInRecipes:row].stats;
}
//图片
- (NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRowInRecipes:row].thumb];
}
//标题
- (NSString *)nameForRow:(NSInteger)row
{
    return [self modelForRowInRecipes:row].name;
}
//作者
- (NSString *)authorForRow:(NSInteger)row
{
    return [self modelForRowInAuthor:row].name;
}
//评分
- (NSString *)scoreForRow:(NSInteger)row
{
    return [self modelForRowInRecipes:row].score;
}
//做过人数
- (NSString *)cookedForRow:(NSInteger)row
{
    return [self modelForRowInStats:row].n_cooked;
}
@end
