//
//  XiaChuFangViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiaChuFangViewModel.h"

@implementation XiaChuFangViewModel

-(NSInteger)listsNumber
{
     //DDLogVerbose(@"l%ld",self.lists.count);
    return self.lists.count;
}
-(NSInteger)recipeListNumber
{
   //DDLogVerbose(@"r%ld",self.recipeLists.count);
    return self.recipeLists.count;
}

-(NSInteger)userNumber
{
   // DDLogVerbose(@"u%ld",self.users.count);
    return self.users.count;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [XiaChuFangNetManager getInitPageCompletionHandle:^(InitPageModel *model, NSError *error) {
        [self.dataArr addObject:model.content];
        self.lists = model.content.pop_lists.lists;
        self.recipeLists = model.content.pop_recipe_lists.recipe_lists;
        self.events = model.content.pop_events.events;
        self.users = model.content.pop_users.users;
//        NSMutableArray *arr = [NSMutableArray new];
//        [arr addObjectsFromArray:model.content.pop_users.users];
//        self.users = [arr copy];
        completionHandle(error);
    }];
}

- (InitPageContentModel *)modelInInitPageContent
{
    return self.dataArr[0];
}
- (NSURL *)weekDateURL//每周
{
    return [NSURL URLWithString:[self modelInInitPageContent].pop_recipe_picurl];
}
- (InitPageContentPopListsListsModel *)modelForRowInLists:(NSInteger)row
{
    return self.lists[row];
}
- (InitPageContentPopRecipeListsRecipeListsModel *)modelForRowInRecipeLists:(NSInteger)row
{
    return self.recipeLists[row];
}
- (InitPageContentPopRecipeListsRecipeListsSampleRecipesModel *)modelForRow:(NSInteger)row
{
    return [self modelForRowInRecipeLists:row].sample_recipes[0];
}

- (InitPageContentPopRecipeListsRecipeListsAuthorModel *)modelForRowInAuthorModel:(NSInteger)row
{
    return [self modelForRowInRecipeLists:row].author;
}

//- (NSURL *)fristURLForRow:(NSInteger)row;//首次

- (NSURL *)iconURLForRowInLists:(NSInteger)row//榜单图片
{
    return [NSURL URLWithString:[self modelForRowInLists:row].pic];
}
- (NSURL *)iconURLForRowInRecipeLists:(NSInteger)row// 流行菜单
{
    return [NSURL URLWithString:[self modelForRow:row].photo280];
}

- (NSString *)titleForRowInLists:(NSInteger)row//榜单标题
{
    return [self modelForRowInLists:row].display_name;
}
- (NSString *)titleForRowInRecipeLists:(NSInteger)row//流行菜单
{
    return [self modelForRowInRecipeLists:row].name;
}

- (NSString *)detailForRowInLists:(NSInteger)row//榜单长标题
{
    return [self modelForRowInLists:row].desc;
}
- (NSString *)detailForRowInRecipeLists:(NSInteger)row//流行菜单
{
    return [self modelForRowInAuthorModel:row].name;
}

- (InitPageContentPopUsersUsersModel *)modelForRowInUsers:(NSInteger)row
{
    
    return self.users[row];
}


//用户头像
- (NSURL *)userPhotoURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRowInUsers:row].photo];
}
@end
