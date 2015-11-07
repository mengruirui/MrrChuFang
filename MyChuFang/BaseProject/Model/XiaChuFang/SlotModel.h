//
//  SlotModel.h
//  BaseProject
//
//  Created by tarena on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class SlotContentModel,SlotContentAdInfoModel,SlotContentAdInfoImageModel;
@interface SlotModel : BaseModel

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) SlotContentModel *content;

@end
@interface SlotContentModel : NSObject

@property (nonatomic, copy) NSString *click_tracking_url;

@property (nonatomic, copy) NSString *expose_tracking_url;

@property (nonatomic, strong) SlotContentAdInfoModel *ad_info;

@property (nonatomic, copy) NSString *start_time;

@property (nonatomic, assign) NSInteger ad_type;

@property (nonatomic, copy) NSString *end_time;

@end

@interface SlotContentAdInfoModel : NSObject

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) SlotContentAdInfoImageModel *image;

@end

@interface SlotContentAdInfoImageModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;

@end

