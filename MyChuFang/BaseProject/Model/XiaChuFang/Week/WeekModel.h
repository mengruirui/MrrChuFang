//
//  WeekModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class WeekContentModel,WeekContentRecipesModel;
@interface WeekModel : BaseModel

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) WeekContentModel *content;

@end
@interface WeekContentModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<WeekContentRecipesModel *> *recipes;

@property (nonatomic, assign) NSInteger total;

@end

@interface WeekContentRecipesModel : NSObject

@property (nonatomic, copy) NSString *recipe_id;

@property (nonatomic, copy) NSString *reason;

@end

