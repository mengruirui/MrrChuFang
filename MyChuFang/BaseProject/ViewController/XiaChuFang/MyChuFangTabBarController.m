//
//  MyChuFangTabBarController.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MyChuFangTabBarController.h"
#import "TRNavigationController.h"

@interface MyChuFangTabBarController ()

@end

@implementation MyChuFangTabBarController
+(MyChuFangTabBarController *)standardInstance
{
    static MyChuFangTabBarController *tabVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabVC = [MyChuFangTabBarController new];
    });
    return tabVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //取消工具栏的透明状态
    self.tabBar.translucent = NO;
    //    self.tabBar.hidden = YES;
    //初始化三个子视图，放到tabbar中
    TRNavigationController *kitchenNavi=[[TRNavigationController alloc] initWithRootViewController:kVCFromSb(@"kitchenVC", @"Main")];
    TRNavigationController *bazaarNavi=[[TRNavigationController alloc] initWithRootViewController:kVCFromSb(@"bazaarVC", @"Main")];
    TRNavigationController *communityNavi=[[TRNavigationController alloc] initWithRootViewController:kVCFromSb(@"communityVC", @"Main")];
    self.viewControllers=@[kitchenNavi,bazaarNavi,communityNavi];
    kitchenNavi.title = @"My厨房";
    kitchenNavi.tabBarItem.image = [[UIImage imageNamed:@"Tabbar_Community"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    kitchenNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tabbar_Community_Selected"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    bazaarNavi.title = @"集市";
    bazaarNavi.tabBarItem.image = [[UIImage imageNamed:@"Tabbar_Recipes"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    bazaarNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tabbar_Recipes_Selected"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    communityNavi.title = @"社区";
    communityNavi.tabBarItem.image = [[UIImage imageNamed:@"Tabbar_Recommend"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    communityNavi.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tabbar_Recommend_Selected"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [self preferredStatusBarStyle];
 }

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end