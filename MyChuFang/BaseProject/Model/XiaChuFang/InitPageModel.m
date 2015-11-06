//
//  InitPageModel.m
//  BaseProject
//
//  Created by tarena on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "InitPageModel.h"

@implementation InitPageModel

@end
@implementation InitPageContentModel

@end


@implementation InitPageContentPopUsersModel

+ (NSDictionary *)objectClassInArray{
    return @{@"users" : [InitPageContentPopUsersUsersModel class]};
}

@end


@implementation InitPageContentPopUsersUsersModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}
@end


@implementation InitPageContentPopEventsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"events" : [InitPageContentPopEventsEventsModel class]};
}

@end


@implementation InitPageContentPopEventsEventsModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end


@implementation InitPageContentPopEventsEventsCustomizationModel

@end


@implementation InitPageContentPopEventsEventsDishesModel

+ (NSDictionary *)objectClassInArray{
    return @{@"dishes" : [InitPageContentPopEventsEventsDishesDishesModel class]};
}

@end


@implementation InitPageContentPopEventsEventsDishesDishesModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end


@implementation InitPageContentPopListsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"lists" : [InitPageContentPopListsListsModel class]};
}

@end


@implementation InitPageContentPopListsListsModel

@end


@implementation InitPageContentPopRecipeListsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"recipe_lists" : [InitPageContentPopRecipeListsRecipeListsModel class]};
}

@end


@implementation InitPageContentPopRecipeListsRecipeListsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"sample_recipes" : [InitPageContentPopRecipeListsRecipeListsSampleRecipesModel class]};
}

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end


@implementation InitPageContentPopRecipeListsRecipeListsAuthorModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end


@implementation InitPageContentPopRecipeListsRecipeListsSampleRecipesModel

@end


