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
    for (VideosDataPackagesModel *model in self.packages) {
        NSString *str= model.title;
        DDLogVerbose(@"str:%@",str);
        if (![model.uid isEqualToString:[self modeForRowInRecipes:row].uid])
        {
            title = model.title;
            break;
        }
    }
    return title;
}
@end
