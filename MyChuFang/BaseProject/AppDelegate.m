//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "XiaChuFangNetManager.h"
#import "LeftViewController.h"
#import "WelcomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    self.window.rootViewController = [WelcomeViewController new];
    [self.window makeKeyAndVisible];
   
    return YES;
}

-(UIWindow *)window
{
    if (!_window) {
        _window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _window;
}
-(RESideMenu *)sideMenu
{
    if (!_sideMenu) {
        _sideMenu = [[RESideMenu alloc]initWithContentViewController:kVCFromSb(@"MyChuFangTabBar", @"Main") leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        _sideMenu.backgroundImage = [UIImage imageNamed:@"BkImage"];
        //不显示菜单
        _sideMenu.menuPrefersStatusBarHidden = YES;
        //不允许菜单栏到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}
@end
