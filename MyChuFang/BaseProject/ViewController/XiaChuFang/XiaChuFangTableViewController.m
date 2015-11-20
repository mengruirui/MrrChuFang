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
#import "iCarousel.h"
#import "SlotViewModel.h"
#import "XiaChuFangURLViewController.h"
#import "LoginViewController.h"
#import "Week/WeekViewController.h"

@interface XiaChuFangTableViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *faXianBtn;
@property (weak, nonatomic) IBOutlet UIView *pageView;
@property (weak, nonatomic) IBOutlet UIButton *activityBtn;
@property (weak, nonatomic) IBOutlet UIButton *weekDateBtn;
@property (weak, nonatomic) IBOutlet UILabel *weekDateLb;

@property (nonatomic,strong)XiaChuFangViewModel *xiaVM;
@property (nonatomic,strong)SlotViewModel *slotVm;

@property (nonatomic,strong)UIView *lastView;
@end

@implementation XiaChuFangTableViewController
{
    iCarousel *_ic;
    UIView * _topView;
    iCarousel *_pageIc;
    UILabel *_numberLb;
    UIPageControl *_pageControl;
    NSTimer *_timer;
}

-(UIView *)lastView
{
    if (!_lastView) {
        _lastView = [UIView new];
    }
    return _lastView;
}

- (UIView *)footerView
{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/635*475)];
    //添加底部视图
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(245, 245, 236);
    [footerView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(kWindowW/635 *224);
        make.bottom.mas_equalTo(0);
    }];
    UIButton *btn = [UIButton buttonWithType:0];
    [btn setTitle:@"+创建菜谱" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    btn.backgroundColor = kRGBColor(244, 78, 63);
    btn.layer.cornerRadius = 5;
    [bottomView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(kWindowW/580*90);
    }];
    //创建菜谱跳转
    [btn bk_addEventHandler:^(id sender) {
        LoginViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"LoginViewController"];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:navi animated:YES completion:nil];
    } forControlEvents:(UIControlEventTouchUpInside)];
    
    UILabel *label = [UILabel new];
    label.text = @"意见反馈";
    label.textColor = kRGBColor(105, 95, 90);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    [bottomView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn.mas_bottom).mas_equalTo(20);
        make.left.right.mas_equalTo(0);
    }];
    
    UIView *topView = [UIView new];
    _topView = topView;
    topView.backgroundColor = kRGBColor(225, 226, 214);
    [footerView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    UILabel *topLb = [UILabel new];
    topLb.text = @"叽咕厨房的厨友们";
    [topView addSubview:topLb];
    [topLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(12);
    }];
    _ic = [iCarousel new];
    [topView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(topLb.mas_bottom).mas_equalTo(10);
        make.bottom.mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.type = 4;
    _ic.scrollSpeed = 1;
    _ic.autoscroll = 0.1;
    return footerView;
}
//添加头部滚动
- (UIView *)eventPageView
{
    [_timer invalidate];
    UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW-24, self.pageView.bounds.size.height)];
    
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.xiaVM.eventNumber;
    _pageControl.pageIndicatorTintColor = kRGBColor(214, 215, 207);
    _pageControl.currentPageIndicatorTintColor = kRGBColor(244, 78, 63);
    _pageControl.userInteractionEnabled = NO;
    [pageView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];

    //滚动视图属性
     _pageIc = [iCarousel new];
    _pageIc.delegate = self;
    _pageIc.dataSource = self;
    _pageIc.pagingEnabled = YES;
    _pageIc.type = 0;
    _pageIc.scrollSpeed = 1;
    [pageView addSubview:_pageIc];
    [_pageIc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(pageView.mas_width);
        make.top.left.mas_equalTo(0);
        make.bottom.mas_equalTo(_pageControl.mas_top).mas_equalTo(-3);
    }];
    
    //启动定时器
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
        
        [_pageIc scrollToItemAtIndex:_pageIc.currentItemIndex +1 animated:YES];
    } repeats:YES];
   
    return pageView;
}

#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    if (carousel == _ic) {
        return self.xiaVM.userNumber;

    }else
    {
        return  self.xiaVM.eventNumber;
    }
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (carousel == _ic) {
        if (!view) {
            view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
            UIImageView *imageView = [UIImageView new];
            [view addSubview:imageView];
            imageView.tag = 100;
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        }
        UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
        imageView.layer.cornerRadius = 30;
        imageView.layer.masksToBounds = YES;
        [imageView setImageWithURL:[self.xiaVM userPhotoURLForRow:index]];
        return view;
    }
    else
    {
        if (!view) {
            view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW-24, _pageIc.bounds.size.height)];
                
                UIView *leftView = [UIView new];
                leftView.backgroundColor = [UIColor whiteColor];
                [view addSubview:leftView];
                
                [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo((kWindowW-24)/2);
                    make.bottom.mas_equalTo(0);
                    make.top.left.mas_equalTo(0);
                    
                }];
                UILabel *titleLb = [UILabel new];
                titleLb.tag = 200;
                titleLb.textAlignment = NSTextAlignmentCenter;
                titleLb.font = [UIFont systemFontOfSize:14];
                [leftView addSubview:titleLb];
                [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(12);
                    make.left.right.mas_equalTo(0);
                }];
                
                UILabel *numberLb = [UILabel new];
                numberLb.tag = 300;
                numberLb.backgroundColor = [UIColor lightGrayColor];
                numberLb.textColor = [UIColor whiteColor];
                numberLb.font = [UIFont systemFontOfSize:12];
                numberLb.textAlignment = NSTextAlignmentCenter;
                numberLb.layer.cornerRadius = 10;
                numberLb.layer.masksToBounds = YES;
                [leftView addSubview:numberLb];
                [numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(85, 25));
                    make.top.mas_equalTo(titleLb.mas_bottom).mas_equalTo(12);
                    make.centerX.mas_equalTo(0);
                }];
                
                UIView *rightView = [UIView new];
                [view addSubview:rightView];
                [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo((kWindowW-24)/2);
                    make.bottom.mas_equalTo(0);
                    make.top.right.mas_equalTo(0);
                    make.left.mas_equalTo(leftView.mas_right).mas_equalTo(0);
                }];
                
                UIImageView *iconIV0 = [UIImageView new];
                
                iconIV0.tag = 400;
            
                [rightView addSubview:iconIV0];
                [iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.left.bottom.mas_equalTo(0);
                    make.width.mas_equalTo((kWindowW-24)/4);
                }];
            
                UIImageView *iconIV1 = [UIImageView new];
            
                iconIV1.tag = 500;
                [rightView addSubview:iconIV1];
                [iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.bottom.mas_equalTo(0);
                    make.width.mas_equalTo((kWindowW-24)/4);
                    make.left.mas_equalTo(iconIV0.mas_right).mas_equalTo(0);
                }];
           
        }
       
            UILabel *titleLb = (UILabel *)[view viewWithTag:200];
            titleLb.text = [self.xiaVM titleForRowInEvents:index];
            UILabel *numberLb = (UILabel *)[view viewWithTag:300];
            numberLb.text = [self.xiaVM numberForRowInEvents:index];
            UIImageView *iconIV0 = (UIImageView *)[view viewWithTag:400];
            [iconIV0 setImageWithURL:[self.xiaVM iconIV0ForRowInEvents:index]];
            UIImageView *iconIV1 = (UIImageView *)[view viewWithTag:500];
            [iconIV1 setImageWithURL:[self.xiaVM iconIV1ForRowInEvents:index]];
            return view;

    }
   
}

/*允许循环滚动*/
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    //修改缝隙
    if (option == iCarouselOptionSpacing) {
        return value * 1.5;
    }
    return value;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}


- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    if (carousel == _pageIc) {
    _pageControl.currentPage = carousel.currentItemIndex;
    }
}


-(XiaChuFangViewModel *)xiaVM
{
    if (!_xiaVM) {
        _xiaVM = [XiaChuFangViewModel new];
    }
    return _xiaVM;
}

- (SlotViewModel *)slotVm
{
    if (!_slotVm) {
        _slotVm = [SlotViewModel new];
    }
    return _slotVm;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Factory addMenuItemToVC:self];
    
    
    self.title = @"叽咕厨房";
    
    //去掉滑动时的竖线
    self.tableView.showsVerticalScrollIndicator = NO;
       [self.xiaVM getDataFromNetCompleteHandle:^(NSError *error) {
           //每周更新
           [self.weekDateBtn setBackgroundImageForState:(UIControlStateNormal) withURL:[self.xiaVM weekDateURL]];
           //添加尾部视图
           self.tableView.tableFooterView = [self footerView];
           [self.tableView reloadData];
           
           
          
           [self.pageView addSubview:[self eventPageView]];
       }];
    
    [self.slotVm getDataFromNetCompleteHandle:^(NSError *error) {
        //活动
        [self.activityBtn setBackgroundImageForState:(UIControlStateNormal) withURL:[self.slotVm slotPicUrl]];
        [self.tableView reloadData];
    }];
    [self.activityBtn bk_addEventHandler:^(id sender) {
        XiaChuFangURLViewController *vc = [[XiaChuFangURLViewController alloc]initWithURL:[self.slotVm slotDeatilURL]];
        vc.title = @"活动";
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
        
    } forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.faXianBtn setBackgroundImage:[UIImage imageNamed:@"begin"] forState:(UIControlStateNormal)];
    
    //每周
    [self.weekDateBtn bk_addEventHandler:^(id sender) {
        WeekViewController *vc = [WeekViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        vc.title = @"每周详情";
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:(UIControlEventTouchUpInside)];
    self.tabBarController.tabBar.translucent = NO;

    
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
        return kWindowW/640*145;
    }
    else
    return 0;
}
//添加第二个分区尾部按钮
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [UIView new];
    UIView *view = [UIView new];
    [footerView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(kWindowW/580*90);
    }];
    view.layer.borderWidth = 1;
    view.layer.borderColor = [UIColor redColor].CGColor;
    view.layer.cornerRadius = 5;
     UIButton *btn = [UIButton buttonWithType:0];
    [btn setTitle:@"全部菜谱分类" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    if (section == 1) {
        return footerView;
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
