//
//  CommunityViewModel.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiaChuFangNetManager.h"

@interface CommunityViewModel : BaseViewModel
- (NSURL *)reformationPicURL;
- (NSURL *)reformationURL;
- (NSString *)titleForRow;
- (NSString *)descForRow;
@property (nonatomic,strong)CommunityContentReformationModel *communityModel;
@end
