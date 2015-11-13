//
//  WeekViewModel.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WeekViewModel.h"


@implementation WeekViewModel
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.offset = 0;
    return [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    self.offset += 20;
    return[self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
   [XiaChuFangNetManager getWeekWithOffset:_offset completionHandle:^(WeekModel *model, NSError *error) {
       if (!error) {
           if (_offset == 0) {
               [self.dataArr removeAllObjects];
           }
           [self.dataArr addObjectsFromArray:model.content.recipes];
           completionHandle(error);
       }
   }];
}
- (WeekContentRecipesModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)IDForRow:(NSInteger)row
{
    return [self modelForRow:row].recipe_id;
}
-(NSString *)reasonForRow:(NSInteger)row
{
    return [self modelForRow:row].reason;
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
@end
