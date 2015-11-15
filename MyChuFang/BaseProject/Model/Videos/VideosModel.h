//
//  VideosModel.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class VideosDataModel,VideosDataGlobalsModel,VideosDataGlobalsImagesizesModel,VideosDataGlobalsImagesizesFullModel,VideosDataPackagesModel,VideosDataHowtovideosModel,VideosDataRecipesModel,VideosDataRecipesStepsModel,VideosDataRecipesStepsBubblehowtovideoModel,VideosDataRecipesStepsIngredientsModel,VideosDataRecipesHowtovideosModel,VideosDataRecipesIngredientsModel,VideosDataKitchenessentialsModel;
@interface VideosModel : BaseModel

@property (nonatomic, strong) VideosDataModel *data;

@end
@interface VideosDataModel : NSObject

@property (nonatomic, strong) NSArray<VideosDataPackagesModel *> *packages;

@property (nonatomic, strong) VideosDataGlobalsModel *globals;

@property (nonatomic, strong) NSArray<VideosDataHowtovideosModel *> *howToVideos;

@property (nonatomic, strong) NSArray<VideosDataRecipesModel *> *recipes;

@property (nonatomic, strong) NSArray<VideosDataKitchenessentialsModel *> *kitchenEssentials;

@end

@interface VideosDataGlobalsModel : NSObject

@property (nonatomic, copy) NSString *serverMaintenanceMessage;

@property (nonatomic, strong) NSArray<NSString *> *imageScales;

@property (nonatomic, strong) NSArray<VideosDataGlobalsImagesizesModel *> *imageSizes;

@property (nonatomic, copy) NSString *serverMaintenanceMode;

@property (nonatomic, assign) NSInteger cookbooksRequiredAppBuild;

@property (nonatomic, copy) NSString *serverMaintenanceTitle;

@end

@interface VideosDataGlobalsImagesizesModel : NSObject

@property (nonatomic, strong) VideosDataGlobalsImagesizesFullModel *full;

@end

@interface VideosDataGlobalsImagesizesFullModel : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *height;

@end

@interface VideosDataPackagesModel : NSObject

@property (nonatomic, copy) NSString *whiteBadgeImage;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *grayBadgeImage;

@end

@interface VideosDataHowtovideosModel : NSObject

@property (nonatomic, copy) NSString *previewImage;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *link;

@end

@interface VideosDataRecipesModel : NSObject

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *recipeUrl;

@property (nonatomic, copy) NSString *wineTipDescription;

@property (nonatomic, copy) NSString *difficulty;

@property (nonatomic, copy) NSString *wineTipName;

@property (nonatomic, assign) NSInteger packageOrder;

@property (nonatomic, assign) NSInteger ingredientsFat;

@property (nonatomic, assign) NSInteger servingsCount;

@property (nonatomic, copy) NSString *videoLink;

@property (nonatomic, assign) NSInteger recipeImageHeight;

@property (nonatomic, strong) NSArray<VideosDataRecipesStepsModel *> *steps;

@property (nonatomic, assign) NSInteger timeBaking;

@property (nonatomic, copy) NSString *recipeImage;

@property (nonatomic, copy) NSString *authorTestimonial;

@property (nonatomic, assign) NSInteger sort;

@property (nonatomic, assign) NSInteger ingredientsProtein;

@property (nonatomic, strong) NSArray<NSString *> *mealTags;

@property (nonatomic, strong) NSArray<NSString *> *ingredientTags;

@property (nonatomic, assign) NSInteger timePreparation;

@property (nonatomic, copy) NSString *recipeShortUrl;

@property (nonatomic, assign) NSInteger ingredientsCarbohydrate;

@property (nonatomic, copy) NSString *authorSignatureImage;

@property (nonatomic, strong) NSArray<VideosDataRecipesIngredientsModel *> *ingredients;

@property (nonatomic, assign) NSInteger craftElementId;

@property (nonatomic, copy) NSString *authorName;

@property (nonatomic, copy) NSString *wineTipYear;

@property (nonatomic, strong) NSArray<NSString *> *utensils;

@property (nonatomic, copy) NSString *authorRestaurant;

@property (nonatomic, copy) NSString *packageUid;

@property (nonatomic, assign) NSInteger ingredientsCalories;

@property (nonatomic, copy) NSString *authorImage;

@property (nonatomic, copy) NSString *wineTipType;

@property (nonatomic, copy) NSString *recipeSmallImage;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *authorVita;

@property (nonatomic, copy) NSString *timeResting;

@property (nonatomic, strong) NSArray<VideosDataRecipesHowtovideosModel *> *howToVideos;

@end

@interface VideosDataRecipesStepsModel : NSObject

@property (nonatomic, strong) NSArray<NSString *> *utensils;

@property (nonatomic, strong) NSArray<VideosDataRecipesStepsIngredientsModel *> *ingredients;

@property (nonatomic, copy) NSString *bubbleBack;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *bubbleFront;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) VideosDataRecipesStepsBubblehowtovideoModel *bubbleHowToVideo;

@end

@interface VideosDataRecipesStepsBubblehowtovideoModel : NSObject

@property (nonatomic, copy) NSString *previewImage;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *link;

@end

@interface VideosDataRecipesStepsIngredientsModel : NSObject

@property (nonatomic, copy) NSString *amount;

@property (nonatomic, copy) NSString *usAmount;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *unit;

@property (nonatomic, copy) NSString *usUnit;

@end

@interface VideosDataRecipesHowtovideosModel : NSObject

@property (nonatomic, copy) NSString *previewImage;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *link;

@end

@interface VideosDataRecipesIngredientsModel : NSObject

@property (nonatomic, copy) NSString *amount;

@property (nonatomic, copy) NSString *usAmount;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *unit;

@property (nonatomic, copy) NSString *usUnit;

@end

@interface VideosDataKitchenessentialsModel : NSObject

@property (nonatomic, copy) NSString *partnerName;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *partnerLink;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *image;

@end

