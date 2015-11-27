//
//  LoginDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginDetailViewController;
@protocol LoginDetailViewControllerDelegate <NSObject>

- (void)loginDetailViewController:(LoginDetailViewController *)vc didImageName:(NSString *)imageName hidden:(BOOL)hidden;
@end

@interface LoginDetailViewController : UIViewController
@property (nonatomic,weak)id<LoginDetailViewControllerDelegate> delegate;
@end
