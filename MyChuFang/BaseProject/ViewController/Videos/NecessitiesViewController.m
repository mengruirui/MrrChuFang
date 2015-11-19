//
//  NecessitiesViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.


#import "NecessitiesViewController.h"
#import "TRNavigationController.h"
#import "NecessitiesCell.h"
#import "VideosViewModel.h"
#import "NecessitiesDeatilViewController.h"

@interface NecessitiesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)VideosViewModel *videosVM;
@end

@implementation NecessitiesViewController
+(UINavigationController *)standardNecessities
{
    static TRNavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NecessitiesViewController *vc = [NecessitiesViewController new];
        navi = [[TRNavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
-(VideosViewModel *)videosVM
{
    if (!_videosVM) {
        _videosVM = [VideosViewModel new];
    }
    return _videosVM;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        //_tableView.rowHeight = 70;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[NecessitiesCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.videosVM getDataFromNetCompleteHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
               }else
               {
                   [_tableView reloadData];
               }
               [_tableView.mj_header endRefreshing];
           }];
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addMenuItemToVC:self];
    self.title = @"必须品";
    [self.tableView.mj_header beginRefreshing];
}
#pragma mark - UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.videosVM.necessitiesNumber1;
    }else{
        return self.videosVM.necessitiesNumber2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NecessitiesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == 0 ) {
        [cell.iconIV.imageView setImageWithURL:[self.videosVM ingredientsImageURLForRow:indexPath.row]];
        cell.titleLb.text = [self.videosVM ingredientsTitleForRow:indexPath.row];
        return cell;
    }
    else
    {
        [cell.iconIV.imageView setImageWithURL:[self.videosVM utensilsImageURLForRow:indexPath.row]];
        cell.titleLb.text = [self.videosVM utensilsTitleForRow:indexPath.row];
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @[@"食材",@"厨房用具及其他"][section];
}
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        NecessitiesDeatilViewController *vc = [[NecessitiesDeatilViewController alloc]initWithImageURL:[self.videosVM ingredientsImageURLForRow:indexPath.row] name:[self.videosVM ingredientsTitleForRow:indexPath.row] desc:[self.videosVM ingredientsDescForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        NecessitiesDeatilViewController *vc = [[NecessitiesDeatilViewController alloc]initWithImageURL:[self.videosVM utensilsImageURLForRow:indexPath.row] name:[self.videosVM utensilsTitleForRow:indexPath.row] desc:[self.videosVM utensilsDescForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
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
