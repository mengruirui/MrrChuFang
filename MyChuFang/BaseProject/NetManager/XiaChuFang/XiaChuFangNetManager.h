//
//  XiaChuFangNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "InitPageModel.h"
#import "SlotModel.h"
#import "WeekModel.h"
@interface XiaChuFangNetManager : BaseNetManager
//下厨房页面
+ (id)getInitPageCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
//活动页
+ (id)getSlotCompletionHandle:(void(^)(id model,NSError *error))completionHandle;

+ (id)getWeekWithOffset:(NSInteger)offset kCompletionHandle;
//http://api.xiachufang.com/v2/recipes/popular_v2.json?version=4.4.0&api_sign=e728c0c9f8551b288e7d65a50c761cc4&offset=0&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&limit=20
@end
