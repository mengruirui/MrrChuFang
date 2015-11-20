//
//  LeftViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import <NSString+Icons.h>
#import "VideosViewController.h"
#import "MyChuFangTabBarController.h"
#import "TipsViewController.h"
#import "NecessitiesViewController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *itemNames;
@end
@implementation LeftViewController
- (NSArray *)itemNames{
    return @[@"食谱", @"贴士", @"资讯", @"用料"];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView=[UIView new];
        [self.view addSubview:_tableView];
        _tableView.backgroundColor=[UIColor clearColor];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
//去掉分割线
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
   // cell.accessoryType = 1;
    cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"turnon"]];
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor =  kRGBColor(254, 123, 0);
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"food1"];
    }else if (indexPath.row == 1)
    {
        cell.imageView.image = [UIImage imageNamed:@"ti1"];
    }else if (indexPath.row == 2)
    {
        cell.imageView.image = [UIImage imageNamed:@"news1"];
    }else
    {
        cell.imageView.image = [UIImage imageNamed:@"things1"];
    }
    return cell;
}
kRemoveCellSeparator
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[VideosViewController standardVideos] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[TipsViewController standardTips] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 2:
             [self.sideMenuViewController setContentViewController:[MyChuFangTabBarController standardInstance] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 3:
            [self.sideMenuViewController setContentViewController:[NecessitiesViewController standardNecessities] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;

        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//必须触发一下tableView的懒加载才可以
    [self.tableView reloadData];
    [self prefersStatusBarHidden];
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
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
