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
#import "WeekDetailModel.h"
#import "CommunityModel.h"
@interface XiaChuFangNetManager : BaseNetManager
//下厨房页面
+ (id)getInitPageCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
//活动页
+ (id)getSlotCompletionHandle:(void(^)(id model,NSError *error))completionHandle;

+ (id)getWeekWithOffset:(NSInteger)offset kCompletionHandle;

+ (id)getWeekDetailWithId:(NSString *)ID kCompletionHandle;

+ (id)getCommunityCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
@end
