//
//  WeekViewModel.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiaChuFangNetManager.h"

@interface WeekViewModel : BaseViewModel
@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSInteger offset;
- (NSString *)IDForRow:(NSInteger)row;
- (NSString *)reasonForRow:(NSInteger)row;
@end
