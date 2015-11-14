//
//  CommunityViewModel.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CommunityViewModel.h"

@implementation CommunityViewModel

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [XiaChuFangNetManager getCommunityCompletionHandle:^(CommunityModel *model, NSError *error) {
        if (!error) {
            [self.dataArr addObject:model.content];
            self.communityModel = model.content.reformation;
        }
    }];
}
-(CommunityContentForumsModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].name;
}
-(NSString *)descForRow:(NSInteger)row
{
    return [self modelForRow:row].desc;
}
-(NSURL *)reformationURL
{
    return [NSURL URLWithString:self.communityModel.index_url];
}
- (NSURL *)reformationPicURL
{
    return [NSURL URLWithString:self.communityModel.pic_url];
}
@end
