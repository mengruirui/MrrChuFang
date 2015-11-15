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
            [self.dataArr addObjectsFromArray:model.content.forums];
            self.communityModel = model.content.reformation;
            completionHandle(error);
        }
    }];
}
-(CommunityContentForumsModel *)modelForRow
{
    return self.dataArr.firstObject;
}
-(NSString *)titleForRow
{
    return [self modelForRow].name;
}
-(NSString *)descForRow
{
    return [self modelForRow].desc;
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
