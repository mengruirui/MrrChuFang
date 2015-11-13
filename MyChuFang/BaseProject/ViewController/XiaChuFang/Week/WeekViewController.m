//
//  WeekViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WeekViewController.h"
#import "WeekDetailViewModel.h"
#import "WeekViewModel.h"
#import "WeekCell.h"

@interface WeekViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)WeekViewModel *weekVM;
@property (nonatomic,strong)WeekDetailViewModel *weekDetailVM;

@property (nonatomic,strong)NSString *ID;
@end

@implementation WeekViewController
-(WeekViewModel *)weekVM
{
    if (!_weekVM) {
        _weekVM = [WeekViewModel new];
    }
    return _weekVM;
}

- (WeekDetailViewModel *)weekDetailVM
{
    if (!_weekDetailVM) {
        _weekDetailVM = [[WeekDetailViewModel alloc]initWithId:self.ID];
    }
    return _weekDetailVM;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[WeekCell class] forCellReuseIdentifier:@"Cell"];
        }
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.weekVM refreshDataCompletionHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error];
           }else
           {
               [_tableView reloadData];
           }
           [_tableView.mj_header endRefreshing];
       }];
        [self.weekDetailVM getDataFromNetCompleteHandle:^(NSError *error) {
            [self.tableView reloadData];
            
        }];
    }];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
          [self.weekVM getMoreDataCompletionHandle:^(NSError *error) {
              if (error) {
                  [self showErrorMsg:error];
              }
              else
              {
                  [_tableView reloadData];
              }
              [_tableView.mj_footer endRefreshing];
          }];
    }];
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView.mj_header beginRefreshing];
    
    self.ID = @"100434180";
}


#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weekVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeekCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //self.ID = [self.weekVM IDForRow:indexPath.row];
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObject:[self.weekVM IDForRow:indexPath.row]];
    [cell.iconIV.imageView setImageWithURL:[self.weekDetailVM iconURLForRow]placeholderImage:[UIImage imageNamed:@""]];
    cell.nameLb.text = [self.weekDetailVM nameForRow];
    cell.cookedLb.text = [self.weekDetailVM cookedForRow];
    cell.authorLb.text = [self.weekDetailVM authorForRow];
    cell.scoreLb.text = [self.weekDetailVM scoreForRow];
    [cell.authIV.imageView setImageWithURL:[self.weekDetailVM photoURLForRow] placeholderImage:[UIImage imageNamed:@""]] ;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
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
