//
//  CommunityModel.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class CommunityContentModel,CommunityContentReformationModel,CommunityContentForumsModel,CommunityContentForumsLatestAuthorsModel;
@interface CommunityModel : BaseModel

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) CommunityContentModel *content;

@end
@interface CommunityContentModel : NSObject

@property (nonatomic, strong) NSArray<CommunityContentForumsModel *> *forums;

@property (nonatomic, strong) CommunityContentReformationModel *reformation;

@end

@interface CommunityContentReformationModel : NSObject

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *index_url;

@end

@interface CommunityContentForumsModel : NSObject

@property (nonatomic, strong) NSArray<CommunityContentForumsLatestAuthorsModel *> *latest_authors;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *desc;

@end

@interface CommunityContentForumsLatestAuthorsModel : NSObject

@property (nonatomic, copy) NSString *mail;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *photo60;

@property (nonatomic, copy) NSString *photo160;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL is_expert;

@end

