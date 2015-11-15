//
//  VideosNetManager.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideosModel.h"

@interface VideosNetManager : BaseNetManager
+ (id)getVideosCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
@end
