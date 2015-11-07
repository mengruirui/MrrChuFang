//
//  XiaChuFangNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiaChuFangNetManager.h"
#define kInitPagePath @"http://api.xiachufang.com/v2/init_page_v4.json"
#define kSlotPath @"http://api.xiachufang.com/v2/ad/show.json"
#define kVersion @"version":@"4.4.0"
#define kApikey @"api_key":@"0f9f79be1dac5f003e7de6f876b17c00"
#define kOrigin @"origin":@"iphone"
#define kSk @"sk":@"CD7J2Gm8QQirQE7KCr0oew"
//api.xiachufang.com/v2/init_page_v4.json?version=4.4.0&timezone=Asia/Shanghai&api_sign=dfe340d67a543539a7323638660fd71a&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=CD7J2Gm8QQirQE7KCr0oew
@implementation XiaChuFangNetManager
+(id)getInitPageCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{kVersion,@"timezone":@"Asia/Shanghai",@"api_sign":@"dfe340d67a543539a7323638660fd71a",kApikey,kOrigin,kSk};
    return [self GET:kInitPagePath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([InitPageModel objectWithKeyValues:responseObj],error);
    }];
}
+(id)getSlotCompletionHandle:(void (^)(id, NSError *))completionHandle
{
    NSDictionary *params = @{@"slot_name":@"homepage_banner_ad1",@"height":@"145",kOrigin,@"api_sign":@"9711d8688f4674a217d0b4b7a5ab11f5",@"width":@"580",@"supported_types":@"1",kVersion,kApikey};
    return [self GET:kSlotPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SlotModel objectWithKeyValues:responseObj],error);
    }];
}
@end
