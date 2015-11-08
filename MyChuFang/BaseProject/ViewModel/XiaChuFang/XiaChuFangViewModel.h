//
//  XiaChuFangViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiaChuFangNetManager.h"

@interface XiaChuFangViewModel : BaseViewModel
@property (nonatomic,strong)NSArray *lists;//榜单
@property (nonatomic,strong)NSArray *recipeLists;//流行菜单
@property (nonatomic,strong)NSArray *events;//滚动
@property (nonatomic,strong)NSArray *users;//用户

@property (nonatomic)NSInteger listsNumber;//榜单数
@property (nonatomic)NSInteger recipeListNumber;//流行菜单数
@property (nonatomic)NSInteger userNumber;//用户数
@property (nonatomic) NSInteger eventNumber;//滚动视图数
- (NSURL *)weekDateURL;//每周
//- (NSURL *)faXianURL;//发现




//用户头像
- (NSURL *)userPhotoURLForRow:(NSInteger)row;

- (NSURL *)iconURLForRowInLists:(NSInteger)row;//榜单图片
- (NSURL *)iconURLForRowInRecipeLists:(NSInteger)row;// 流行菜单

- (NSString *)titleForRowInLists:(NSInteger)row;//榜单标题
- (NSString *)titleForRowInRecipeLists:(NSInteger)row;//流行菜单

- (NSString *)detailForRowInLists:(NSInteger)row;//榜单长标题
- (NSString *)detailForRowInRecipeLists:(NSInteger)row;//流行菜单

//滚动视图中标题
- (NSString *)titleForRowInEvents:(NSInteger)row;
//数量
- (NSString *)numberForRowInEvents:(NSInteger)row;
//第一张图
- (NSURL *)iconIV0ForRowInEvents:(NSInteger)row;
//第二张图
- (NSURL *)iconIV1ForRowInEvents:(NSInteger)row;
@end
