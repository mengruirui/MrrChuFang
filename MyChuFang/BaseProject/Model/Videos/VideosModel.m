//
//  VideosModel.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosModel.h"

@implementation VideosModel

@end
@implementation VideosDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"packages" : [VideosDataPackagesModel class], @"howToVideos" : [VideosDataHowtovideosModel class], @"recipes" : [VideosDataRecipesModel class], @"kitchenEssentials" : [VideosDataKitchenessentialsModel class]};
}

@end


@implementation VideosDataGlobalsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"imageSizes" : [VideosDataGlobalsImagesizesModel class]};
}

@end


@implementation VideosDataGlobalsImagesizesModel

@end


@implementation VideosDataGlobalsImagesizesFullModel

@end


@implementation VideosDataPackagesModel

@end


@implementation VideosDataHowtovideosModel

@end


@implementation VideosDataRecipesModel

+ (NSDictionary *)objectClassInArray{
    return @{@"steps" : [VideosDataRecipesStepsModel class], @"howToVideos" : [VideosDataRecipesHowtovideosModel class], @"ingredients" : [VideosDataRecipesIngredientsModel class]};
}

@end


@implementation VideosDataRecipesStepsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"ingredients" : [VideosDataRecipesStepsIngredientsModel class]};
}

@end


@implementation VideosDataRecipesStepsBubblehowtovideoModel

@end


@implementation VideosDataRecipesStepsIngredientsModel

@end


@implementation VideosDataRecipesHowtovideosModel

@end


@implementation VideosDataRecipesIngredientsModel

@end


@implementation VideosDataKitchenessentialsModel

@end


