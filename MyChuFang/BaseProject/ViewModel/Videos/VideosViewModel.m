//
//  VideosViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosViewModel.h"


@implementation VideosViewModel
-(NSInteger)rowNumber
{
    return self.recipes.count;
}
-(NSInteger)tipsRowNumber
{
    return self.howToVideos.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [VideosNetManager getVideosCompletionHandle:^(VideosModel *model, NSError *error) {
        self.recipes = model.data.recipes;
        self.packages = model.data.packages;
        self.howToVideos = model.data.howToVideos;
        self.kitchenEssentials = model.data.kitchenEssentials;
        completionHandle(error);
    }];
}
-(VideosDataRecipesModel *)modeForRowInRecipes:(NSInteger)row
{
    return self.recipes[row];
}
- (VideosDataHowtovideosModel *)modelForRowInHowtovideos:(NSInteger)row
{
    return self.howToVideos[row];
}
-(NSURL *)recipeImageURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modeForRowInRecipes:row].recipeImage];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modeForRowInRecipes:row].title;
}
-(BOOL)isVideoForRow:(NSInteger)row
{
    return ![[self modeForRowInRecipes:row].videoLink isEqualToString:@""] ? YES : NO;
}
-(NSString *)packagesTitleForRow:(NSInteger)row
{
    NSString *title = nil;
    NSString *recipes = nil;
    NSString *packages = nil;
    for (VideosDataPackagesModel *model in self.packages) {
        recipes = [self modeForRowInRecipes:row].uid;
        packages = model.uid;
        NSArray *rArr = [recipes componentsSeparatedByString:@"."];
        NSArray *pArr = [packages componentsSeparatedByString:@"."];
        if ([rArr[0] isEqualToString:pArr[0]])
        {
            title = model.title;
            break;
        }
    }
    return title;
}
-(NSURL *)tipsImageURLForRow:(NSInteger)row
{
    return  [NSURL URLWithString:[self modelForRowInHowtovideos:row].previewImage];
}
-(NSString *)tipsTitleForRow:(NSInteger)row
{
    return [self modelForRowInHowtovideos:row].title;
}
-(NSURL *)tipsVideoURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRowInHowtovideos:row].link];
}

//有视频的地址
- (NSURL *)videoURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modeForRowInRecipes:row].videoLink];
}
//webView 请求地址
- (NSURL *)htmlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modeForRowInRecipes:row].recipeShortUrl];
}
- (NSArray *)howToVideosForRow:(NSInteger)row
{
    return [self modeForRowInRecipes:row].howToVideos;
}
- (NSURL *)previewImage1URLForRow:(NSInteger)row
{
    NSArray *arr = [self howToVideosForRow:row];
    VideosDataRecipesHowtovideosModel *model = arr.firstObject;
    return [NSURL URLWithString:model.previewImage];
}
- (NSURL *)previewImage2URLForRow:(NSInteger)row
{
    NSArray *arr = [self howToVideosForRow:row];
    VideosDataRecipesHowtovideosModel *model = arr.lastObject;
    return [NSURL URLWithString:model.previewImage];
}
//详情页视频标题
- (NSString *)title1ForRowInVideo:(NSInteger)row
{
    NSArray *arr = [self howToVideosForRow:row];
    VideosDataRecipesHowtovideosModel *model = arr.firstObject;
    return model.title;
}
- (NSString *)title2ForRowInVideo:(NSInteger)row
{
    NSArray *arr = [self howToVideosForRow:row];
    VideosDataRecipesHowtovideosModel *model = arr.lastObject;
    return model.title;
}
//详情页视频地址
- (NSURL *)link1URLForRowInVideo:(NSInteger)row
{
    NSArray *arr = [self howToVideosForRow:row];
    VideosDataRecipesHowtovideosModel *model = arr.firstObject;
    return [NSURL URLWithString:model.link];
}
- (NSURL *)link2URLForRowInVideo:(NSInteger)row
{
    NSArray *arr = [self howToVideosForRow:row];
    VideosDataRecipesHowtovideosModel *model = arr.lastObject;
    return [NSURL URLWithString:model.link];
}
@end
