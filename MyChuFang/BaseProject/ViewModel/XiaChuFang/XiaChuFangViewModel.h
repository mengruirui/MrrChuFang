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

@property (nonatomic)NSInteger listsNumber;
@property (nonatomic)NSInteger recipeListNumber;
@property (nonatomic)NSInteger userNumber;
@property (nonatomic) NSInteger eventNumber;

- (NSURL *)weekDateURL;//每周
//- (NSURL *)faXianURL;//发现
//- (NSURL *)eventImagesURL;//滚动

//- (NSURL *)fristURLForRow:(NSInteger)row;//首次

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
- (NSString *)numberForRowInEvents:(NSInteger)row;
@end
