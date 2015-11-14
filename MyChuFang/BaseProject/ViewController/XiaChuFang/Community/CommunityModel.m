//
//  CommunityModel.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CommunityModel.h"

@implementation CommunityModel

@end
@implementation CommunityContentModel

+ (NSDictionary *)objectClassInArray{
    return @{@"forums" : [CommunityContentForumsModel class]};
}

@end


@implementation CommunityContentReformationModel

@end


@implementation CommunityContentForumsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"latest_authors" : [CommunityContentForumsLatestAuthorsModel class]};
}

@end


@implementation CommunityContentForumsLatestAuthorsModel

@end


