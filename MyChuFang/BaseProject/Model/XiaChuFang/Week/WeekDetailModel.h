//
//  WeekDetailModel.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class WeekDetailContentModel,WeekDetailContentRecipesModel,WeekDetailContentRecipesInstructionStatsModel,WeekDetailContentRecipesInstructionAuthorModel,WeekDetailContentRecipesInstructionIngredientModel,WeekDetailContentRecipesInstructionModel;
@interface WeekDetailModel : BaseModel

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) WeekDetailContentModel *content;

@end
@interface WeekDetailContentModel : NSObject

@property (nonatomic, strong) NSArray<WeekDetailContentRecipesModel *> *recipes;

@property (nonatomic, assign) NSInteger total;

@end

@interface WeekDetailContentRecipesModel : NSObject

@property (nonatomic, strong) NSArray *dish_author;

@property (nonatomic, copy) NSString *photo340;

@property (nonatomic, copy) NSString *video_url;

@property (nonatomic, copy) NSString *photo90;

@property (nonatomic, copy) NSString *photo140;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *ident;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *purchase_url;

@property (nonatomic, strong) NSArray<WeekDetailContentRecipesInstructionModel *> *instruction;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *score;

@property (nonatomic, copy) NSString *photo280;

@property (nonatomic, copy) NSString *friendly_create_time;

@property (nonatomic, copy) NSString *photo640;

@property (nonatomic, copy) NSString *photo80;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *tips;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *photo526;

@property (nonatomic, assign) BOOL is_exclusive;

@property (nonatomic, copy) NSString *photo580;

@property (nonatomic, strong) WeekDetailContentRecipesInstructionStatsModel *stats;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) WeekDetailContentRecipesInstructionAuthorModel *author;

@property (nonatomic, strong) NSArray<WeekDetailContentRecipesInstructionIngredientModel *> *ingredient;

@end

@interface WeekDetailContentRecipesInstructionStatsModel : NSObject

@property (nonatomic, copy) NSString *n_cooked_last_week;

@property (nonatomic, copy) NSString *n_comments;

@property (nonatomic, copy) NSString *n_cooked;

@property (nonatomic, assign) BOOL cooked_by_me;

@property (nonatomic, copy) NSString *n_collects;

@property (nonatomic, copy) NSString *n_dishes;

@property (nonatomic, copy) NSString *n_pv;

@end

@interface WeekDetailContentRecipesInstructionAuthorModel : NSObject

@property (nonatomic, copy) NSString *mail;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *photo60;

@property (nonatomic, copy) NSString *photo160;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL is_expert;

@end

@interface WeekDetailContentRecipesInstructionIngredientModel : NSObject

@property (nonatomic, copy) NSString *amount;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *cat;

@end

@interface WeekDetailContentRecipesInstructionModel : NSObject

@property (nonatomic, copy) NSString *ident;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *step;

@property (nonatomic, copy) NSString *text;

@end

