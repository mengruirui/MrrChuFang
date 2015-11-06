//
//  InitPageModel.h
//  BaseProject
//
//  Created by tarena on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class InitPageContentModel,InitPageContentPopUsersModel,InitPageContentPopUsersUsersModel,InitPageContentPopEventsModel,InitPageContentPopEventsEventsModel,InitPageContentPopEventsEventsCustomizationModel,InitPageContentPopEventsEventsDishesModel,InitPageContentPopEventsEventsDishesDishesModel,InitPageContentPopListsModel,InitPageContentPopListsListsModel,InitPageContentPopRecipeListsModel,InitPageContentPopRecipeListsRecipeListsModel,InitPageContentPopRecipeListsRecipeListsAuthorModel,InitPageContentPopRecipeListsRecipeListsSampleRecipesModel;
@interface InitPageModel : BaseModel

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) InitPageContentModel *content;

@end
@interface InitPageContentModel : NSObject

@property (nonatomic, strong) InitPageContentPopEventsModel *pop_events;

@property (nonatomic, strong) InitPageContentPopUsersModel *pop_users;

@property (nonatomic, copy) NSString *pop_recipe_picurl;

@property (nonatomic, strong) InitPageContentPopListsModel *pop_lists;

@property (nonatomic, strong) InitPageContentPopRecipeListsModel *pop_recipe_lists;

@end

@interface InitPageContentPopUsersModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<InitPageContentPopUsersUsersModel *> *users;

@end

@interface InitPageContentPopUsersUsersModel : NSObject

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@end

@interface InitPageContentPopEventsModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<InitPageContentPopEventsEventsModel *> *events;

@end

@interface InitPageContentPopEventsEventsModel : NSObject

@property (nonatomic, strong) InitPageContentPopEventsEventsCustomizationModel *customization;

@property (nonatomic, assign) NSInteger n_dishes;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) InitPageContentPopEventsEventsDishesModel *dishes;

@property (nonatomic, copy) NSString *name;

@end

@interface InitPageContentPopEventsEventsCustomizationModel : NSObject

@end

@interface InitPageContentPopEventsEventsDishesModel : NSObject

@property (nonatomic, strong) NSArray<InitPageContentPopEventsEventsDishesDishesModel *> *dishes;

@end

@interface InitPageContentPopEventsEventsDishesDishesModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *thumbnail_160;

@end

@interface InitPageContentPopListsModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<InitPageContentPopListsListsModel *> *lists;

@end

@interface InitPageContentPopListsListsModel : NSObject

@property (nonatomic, copy) NSString *display_name;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *desc;

@end

@interface InitPageContentPopRecipeListsModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<InitPageContentPopRecipeListsRecipeListsModel *> *recipe_lists;

@end

@interface InitPageContentPopRecipeListsRecipeListsModel : NSObject

@property (nonatomic, strong) NSArray<NSString *> *pics;

@property (nonatomic, strong) InitPageContentPopRecipeListsRecipeListsAuthorModel *author;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) NSArray<InitPageContentPopRecipeListsRecipeListsSampleRecipesModel *> *sample_recipes;

@property (nonatomic, copy) NSString *name;

@end

@interface InitPageContentPopRecipeListsRecipeListsAuthorModel : NSObject

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@end

@interface InitPageContentPopRecipeListsRecipeListsSampleRecipesModel : NSObject

@property (nonatomic, copy) NSString *photo280;

@end

