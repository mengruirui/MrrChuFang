//
//  VideosViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideosNetManager.h"

@interface VideosViewModel : BaseViewModel
@property (nonatomic)NSInteger rowNumber;
@property (nonatomic) NSInteger tipsRowNumber;
-(NSURL *)recipeImageURLForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
- (NSString *)packagesTitleForRow:(NSInteger)row;
-(BOOL)isVideoForRow:(NSInteger)row;
-(NSURL *)tipsImageURLForRow:(NSInteger)row;
-(NSString *)tipsTitleForRow:(NSInteger)row;
-(NSURL *)tipsVideoURLForRow:(NSInteger)row;
@property (nonatomic,strong) NSArray *packages;
@property (nonatomic,strong) NSArray *howToVideos;
@property (nonatomic,strong) NSArray *recipes;
@property (nonatomic,strong) NSArray *kitchenEssentials;

//有视频的地址
- (NSURL *)videoURLForRow:(NSInteger)row;
//webView 请求地址
- (NSURL *)htmlForRow:(NSInteger)row;
- (NSArray *)howToVideosForRow:(NSInteger)row;
//详情页视频图片
- (NSURL *)previewImage1URLForRow:(NSInteger)row;
- (NSURL *)previewImage2URLForRow:(NSInteger)row;
//详情页视频标题
- (NSString *)title1ForRowInVideo:(NSInteger)row;
- (NSString *)title2ForRowInVideo:(NSInteger)row;
//详情页视频地址
- (NSURL *)link1URLForRowInVideo:(NSInteger)row;
- (NSURL *)link2URLForRowInVideo:(NSInteger)row;
@end
