//
//  userModel.h
//  BaseProject
//
//  Created by tarena on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel
@property (nonatomic,strong)NSString *userName;
@property (nonatomic,strong)NSString *passWord;
@property (nonatomic,strong)NSString *image;

+ (NSArray *)user;
+ (NSArray *)userListWithUserName:(NSString *)userName andPassWord:(NSString *)passWord;
// 添加新用户
- (BOOL) addUserWithUserName:(NSString *)userName PassWord:(NSString *)passWord Image:(NSString *)image;
@end
