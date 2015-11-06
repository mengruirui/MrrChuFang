//
//  XiaChuFangTableViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiaChuFangTableViewController.h"
#import "XiaChuFangViewModel.h"
#import "XiaChuFangCell.h"

@interface XiaChuFangTableViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *faXianBtn;
@property (weak, nonatomic) IBOutlet UIView *pageView;
@property (weak, nonatomic) IBOutlet UIButton *fristBtn;
@property (weak, nonatomic) IBOutlet UIButton *weekDateBtn;
@property (weak, nonatomic) IBOutlet UILabel *weekDateLb;

@property (nonatomic,strong)XiaChuFangViewModel *xiaVM;
@end

@implementation XiaChuFangTableViewController

-(XiaChuFangViewModel *)xiaVM
{
    if (!_xiaVM) {
        _xiaVM = [XiaChuFangViewModel new];
    }
    return _xiaVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
       [self.xiaVM getDataFromNetCompleteHandle:^(NSError *error) {
           [self.weekDateBtn setBackgroundImageForState:(UIControlStateNormal) withURL:[self.xiaVM weekDateURL]];
           [self.tableView reloadData];
       }];
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    if (section == 0) {
        return self.xiaVM.recipeListNumber;
    }else
    
    return self.xiaVM.listsNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XiaChuFangCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        [cell.iconIV setImageWithURL:[self.xiaVM iconURLForRowInRecipeLists:indexPath.row]];
        cell.titleLb.text = [self.xiaVM titleForRowInRecipeLists:indexPath.row];
        cell.detailLb.text = [self.xiaVM detailForRowInRecipeLists:indexPath.row];
    }else
    {
    [cell.iconIV setImageWithURL:[self.xiaVM iconURLForRowInLists:indexPath.row]];
    cell.titleLb.text = [self.xiaVM titleForRowInLists:indexPath.row];
    cell.detailLb.text = [self.xiaVM detailForRowInLists:indexPath.row];
    }
    
    return cell;
}

//去掉缝隙
kRemoveCellSeparator

//取消点击高亮
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//添加分区头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @[@"流行菜单",@"榜单"][section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return 100;
    }
    else
    return 0;
}
//添加第二个分区尾部按钮
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [UIView new];
     UIButton *btn = [UIButton buttonWithType:0];
    [btn setTitle:@"全部菜谱分类" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor redColor].CGColor;
    btn.layer.cornerRadius = 5;
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(60);
    }];
    if (section == 1) {
        return view;
    }
    
    return nil;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
