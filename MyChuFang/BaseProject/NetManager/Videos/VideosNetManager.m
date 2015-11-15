//
//  VideosNetManager.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosNetManager.h"
#define kVideosPath @"http://content.kitchenstories.de/v2/zh/content.json"



@implementation VideosNetManager
+(id)getVideosCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    return  [self GET:kVideosPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideosModel objectWithKeyValues:responseObj],error);
    }];
}
@end
