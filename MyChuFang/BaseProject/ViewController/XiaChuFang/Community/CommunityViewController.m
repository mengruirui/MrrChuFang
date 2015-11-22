//
//  CommunityViewController.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CommunityViewController.h"
#import "CommunityCell.h"
#import "CommunityPicCell.h"
#import "CommunityViewModel.h"
#import "MyHomeViewController.h"

@interface CommunityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) CommunityViewModel *communityVM;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation CommunityViewController

-(CommunityViewModel *)communityVM
{
    if (!_communityVM) {
        _communityVM = [CommunityViewModel new];
    }
    return _communityVM;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[CommunityCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[CommunityPicCell class] forCellReuseIdentifier:@"PicCell"];
       
           [self.communityVM getDataFromNetCompleteHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error];
               }else
               {
                   [_tableView reloadData];
               }
        }];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addMenuItemToVC:self];
    [self.tableView reloadData];
    self.tableView.separatorColor = [UIColor clearColor];
}

#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (indexPath.row == 0) {
        cell.descLb.text = [self.communityVM descForRow];
        cell.titleLb.text = [self.communityVM titleForRow];
        cell.iconIV.imageView.image = [UIImage imageNamed:@"shequ"];
        return cell;
    }else if (indexPath.row == 1)
    {
        cell.descLb.text = @"身边的厨友会";
        cell.titleLb.text = @"周边";
        cell.iconIV.imageView.image = [UIImage imageNamed:@"zhoubian"];
        return cell;
    }else
    {
        if ([self.communityVM reformationURL]) {
            return nil;
        }else
        {
        CommunityPicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PicCell"];
        [cell.iconIV.imageView setImageWithURL:[self.communityVM reformationPicURL] placeholderImage:[UIImage imageNamed:@""]];
        return cell;
        }
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 2) {
        MyHomeViewController *vc = [[MyHomeViewController alloc]initWithURL:[self.communityVM reformationURL]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
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
