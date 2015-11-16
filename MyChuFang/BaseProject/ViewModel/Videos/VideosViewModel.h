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
-(NSURL *)recipeImageURLForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
- (NSString *)packagesTitleForRow:(NSInteger)row;
-(BOOL)isVideoForRow:(NSInteger)row;
@property (nonatomic,strong) NSArray *packages;
@property (nonatomic,strong) NSArray *howToVideos;
@property (nonatomic,strong) NSArray *recipes;
@property (nonatomic,strong) NSArray *kitchenEssentials;
@end
