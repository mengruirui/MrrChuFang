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
- (instancetype)initWithId:(NSString *)ID;
@property (nonatomic,strong) NSString *ID;

//图片
- (NSURL *)iconURLForRow:(NSInteger)row;
//标题
- (NSString *)nameForRow:(NSInteger)row;
//作者
- (NSString *)authorForRow:(NSInteger)row;
//评分
- (NSString *)scoreForRow:(NSInteger)row;
//做过人数
- (NSString *)cookedForRow:(NSInteger)row;
@end
