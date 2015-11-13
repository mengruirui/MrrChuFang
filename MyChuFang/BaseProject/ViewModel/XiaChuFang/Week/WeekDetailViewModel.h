//
//  WeekDetailViewModel.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiaChuFangNetManager.h"

@interface WeekDetailViewModel : BaseViewModel

-(instancetype)initWithId:(NSString *)ID;
@property (nonatomic,strong) NSString *ID;

//图片
- (NSURL *)iconURLForRow;
//标题
- (NSString *)nameForRow;
//作者
- (NSString *)authorForRow;
//评分
- (NSString *)scoreForRow;
//做过人数
- (NSString *)cookedForRow;
//作者图片
- (NSURL *)photoURLForRow;
@end
