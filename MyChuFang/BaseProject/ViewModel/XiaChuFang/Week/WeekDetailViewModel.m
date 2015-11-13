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
    [XiaChuFangNetManager getWeekDetailWithId:self.ID completionHandle:^(WeekDetailModel *model, NSError *error) {
        if (!error) {
            self.dataArr = [model.content.recipes copy];
            completionHandle(error);
        }
    }];
}
- (WeekDetailContentRecipesModel *)modelForRowInRecipes
{
    return self.dataArr.firstObject;
}
- (WeekDetailContentRecipesInstructionAuthorModel *)modelForRowInAuthor
{
    return [self modelForRowInRecipes].author;
}
- (WeekDetailContentRecipesInstructionStatsModel *)modelForRowInStats
{
    return [self modelForRowInRecipes].stats;
}
//图片
- (NSURL *)iconURLForRow
{
    return [NSURL URLWithString:[self modelForRowInRecipes].thumb];
}
//标题
- (NSString *)nameForRow
{
    return [self modelForRowInRecipes].name;
}
//作者
- (NSString *)authorForRow
{
    return [self modelForRowInAuthor].name;
}
//评分
- (NSString *)scoreForRow
{
    return [ NSString stringWithFormat:@"%@ 评分",[self modelForRowInRecipes].score];
}
//做过人数
- (NSString *)cookedForRow
{
    return  [NSString stringWithFormat:@"%@ 做过",[self modelForRowInStats].n_cooked];
}
-(NSURL *)photoURLForRow
{
    return [NSURL URLWithString:[self modelForRowInAuthor].photo];
}
@end
