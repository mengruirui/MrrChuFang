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
#import "TRTabBarController.h"
#import "TRNavigationController.h"
#import "MyChuFangTabBarController.h"
#import "VideosNetManager.h"
#import <SMS_SDK/SMSSDK.h>
#define AppKey @"c8912bf6e38a"
#define AppSecret @"4b2f13eb00438769f4259f94b28dec9a"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    //短信验证
    //申请 shareSdk 授权
    [SMSSDK registerApp:AppKey withSecret:AppSecret];
    
        /*
     需求:用户首次打开项目,显示欢迎界面.以后则直接显示主页面
     2.如果用户升级程序后,首次打开,则显示欢迎界面,以后显示主页面
     解决方案:
     每次运行 都查看用户之前是否运行过版本.如果用户运行过,则显示主页面.如果没有运行过则显示欢迎界面,并且把用户已运行版本号进行更新
     */
    //1.需要手动初始化window
    //2.获取当前系统版本号
    //根据plist文件中,root类型是NSDictionary,所以读取出来的是字典类型
    NSDictionary *infoDic = [[NSBundle mainBundle]infoDictionary];
    /*
     版本号:
     version:正式发布版本号,用户只能看到version
     build:测试版本号,是对于程序员来说的
     */
    //NSLog(@"infoDic: %@",infoDic);
    NSString *key = @"CFBundleShortVersionString";
    NSString *currentVersion = infoDic[key];
    //已运行过的版本号需要持久化处理,通常存储在userDefault中
    NSString *runVersion = [[NSUserDefaults standardUserDefaults]stringForKey:key];
    
    if (runVersion == nil || ![runVersion isEqualToString:currentVersion]) {
        //没运行过 或者 版本号不一致,则显示欢迎页
        self.window.rootViewController = [WelcomeViewController new];
        //保存新的版本号,防止下次运行再显示欢迎页
        [[NSUserDefaults standardUserDefaults]setValue:currentVersion forKey:key];
    }else
    {
        self.window.rootViewController = self.sideMenu;
    }

    //改变状态栏颜色 先在info.plist中添加View controller-based status bar appearance设置为 NO
    
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //[[UIApplication sharedApplication]setStatusBarHidden:YES];
    
   [self movePoetryDBToDoc];
    return YES;
}

-(UIWindow *)window
{
    if (!_window) {
        _window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}
-(RESideMenu *)sideMenu
{
    if (!_sideMenu) {
        _sideMenu = [[RESideMenu alloc]initWithContentViewController:[MyChuFangTabBarController standardInstance]leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        
        _sideMenu.backgroundImage = [UIImage imageNamed:@"changed"];
        //不显示菜单
        _sideMenu.menuPrefersStatusBarHidden = YES;
        //不允许菜单栏到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
        //_sideMenu.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
        
    }
    return _sideMenu;
}

/*
 因为要对数据库中的数据进行删除操作,但是 app 目录下的文件都是只读的,所以我们要复制一份到 document 文件夹下,以后就都对 document 文件夹下的数据库做操作
 */
- (void)movePoetryDBToDoc
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"user" ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:@"sqlite.db"];
    NSLog(@"path %@",path);
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    docPath = [docPath stringByAppendingPathComponent:@"sqlite.db"];
    NSLog(@"docPath %@",docPath);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:docPath]) {
        [fileManager moveItemAtPath:path toPath:docPath error:nil];
    }
}

@end
