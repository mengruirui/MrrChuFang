//
//  SlotViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SlotViewModel.h"

@implementation SlotViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
  self.dataTask = [XiaChuFangNetManager getSlotCompletionHandle:^(SlotModel *model, NSError *error) {
      [self.dataArr addObject:model.content.ad_info];
      completionHandle(error);
    }];
}
- (SlotContentAdInfoModel *)modeInAdInfo
{
    
    return self.dataArr.firstObject;
}
-(NSURL *)slotPicUrl
{
    return [NSURL URLWithString:[self modeInAdInfo].pic_url];
}
-(NSURL *)slotDeatilURL
{
    return [NSURL URLWithString:[self modeInAdInfo].url];
}
@end
