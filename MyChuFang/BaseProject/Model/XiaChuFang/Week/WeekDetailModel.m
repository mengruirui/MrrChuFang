//
//  WeekDetailModel.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WeekDetailModel.h"

@implementation WeekDetailModel

@end
@implementation WeekDetailContentModel

+ (NSDictionary *)objectClassInArray{
    return @{@"recipes" : [WeekDetailContentRecipesModel class]};
}

@end


@implementation WeekDetailContentRecipesModel

+ (NSDictionary *)objectClassInArray{
    return @{@"ingredient" : [WeekDetailContentRecipesInstructionIngredientModel class], @"instruction" : [WeekDetailContentRecipesInstructionModel class]};
}

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"id":@"ID"};
}

@end


@implementation WeekDetailContentRecipesInstructionStatsModel

@end


@implementation WeekDetailContentRecipesInstructionAuthorModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"id":@"ID"};
}

@end


@implementation WeekDetailContentRecipesInstructionIngredientModel

@end


@implementation WeekDetailContentRecipesInstructionModel

@end


