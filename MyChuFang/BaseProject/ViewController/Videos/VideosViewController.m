//
//  VideosViewController.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosViewController.h"
#import "TRNavigationController.h"
#import "VideosViewModel.h"
#import "PSCollectionView.h"
#import "PSCollectionViewCell.h"
#import "TRImageView.h"
#import "VideosCell.h"
#import "VideosDeatilVideoViewController.h"
#import "VideoDetailPicViewController.h"

@interface VideosViewController ()<PSCollectionViewDelegate,PSCollectionViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong) VideosViewModel *videosVM;
@property (nonatomic,strong) PSCollectionView *collectionView;

@end

@implementation VideosViewController
+(UINavigationController *)standardVideos
{
    static TRNavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navi = [[TRNavigationController alloc]initWithRootViewController:[VideosViewController new]];
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
-(PSCollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
        _collectionView.delegate = self;
        _collectionView.collectionViewDelegate = self;
        _collectionView.collectionViewDataSource = self;
        //设置竖向 两行
        _collectionView.numColsPortrait = 2;
       // _collectionView.autoresizingMask = UIViewAutoresizingNone;
        [self.view addSubview:_collectionView];
        
        //头部刷新
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.videosVM getDataFromNetCompleteHandle:^(NSError *error) {
                //AF的回调 是在主线程中
                [_collectionView reloadData];
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }
                [_collectionView.mj_header endRefreshing];
            }];
            
        }];

    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.view.backgroundColor = kRGBColor(224, 224, 224);
    self.title = @"食谱";
    
    [self.collectionView.mj_header beginRefreshing];
    
}



-(NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView
{
    return self.videosVM.rowNumber;
}
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index
{
   
    
    return 300.0;
}

-(PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index
{
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:nil];
    if (!cell) {

            cell = [[PSCollectionViewCell alloc]initWithFrame:CGRectZero];
            cell.backgroundColor = [UIColor whiteColor];
            cell.layer.cornerRadius = 5;
            UIImageView *imageView = [UIImageView new];
            imageView.contentMode = 2;
            [cell addSubview:imageView];
             imageView.tag = 200;
             imageView.frame = CGRectMake(0, 0, kWindowW/2 - 12, [self collectionView:collectionView heightForRowAtIndex:index]-40);
            TRImageView *videoIV = [TRImageView new];
            videoIV.tag = 400;
            [cell addSubview:videoIV];
            [videoIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottomMargin.mas_equalTo(imageView.mas_bottomMargin).mas_equalTo(-2);
                make.rightMargin.mas_equalTo(imageView.mas_rightMargin).mas_equalTo(-2);
                make.size.mas_equalTo(CGSizeMake(35, 35));
            }];
    
            UILabel *titleLb = [UILabel new];
            titleLb.tag = 300;
            titleLb.font = [UIFont systemFontOfSize:13];
            titleLb.numberOfLines = 0;
            [cell addSubview:titleLb];
            [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(imageView.mas_bottom).mas_equalTo(5);
                make.leftMargin.mas_equalTo(imageView.mas_leftMargin).mas_equalTo(8);
                make.rightMargin.mas_equalTo(imageView.mas_rightMargin).mas_equalTo(-8);
                make.bottom.mas_equalTo(0);
            }];
            cell.clipsToBounds = YES;
    
        }
        UIImageView *iv = (UIImageView *)[cell viewWithTag:200];
        [iv setImageWithURL:[self.videosVM recipeImageURLForRow:index] placeholderImage:[UIImage imageNamed:@"load"]];
        UILabel *titleLb = (UILabel *)[cell viewWithTag:300];
        titleLb.numberOfLines = 0;
        titleLb.text = [self.videosVM titleForRow:index];
        if ([self.videosVM isVideoForRow:index]) {
            TRImageView *videoIV = (TRImageView *)[cell viewWithTag:400];
            videoIV.imageView.image = [UIImage imageNamed:@"Icon_Video_Play"];
        }
    return cell;
}
-(void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index
{
    if ([self.videosVM isVideoForRow:index]) {
        VideosDeatilVideoViewController *vc = [[VideosDeatilVideoViewController alloc]initWithWebURL:[self.videosVM htmlForRow:index] videoURL:[self.videosVM videoURLForRow:index] videoImageURL:[self.videosVM recipeImageURLForRow:index] btn1URL:[self.videosVM link1URLForRowInVideo:index] btn2URL:[self.videosVM link2URLForRowInVideo:index ]btn1Pic:[self.videosVM previewImage1URLForRow:index] btn2Pic:[self.videosVM previewImage2URLForRow:index] name:[self.videosVM titleForRow:index] btn1Title:[self.videosVM title1ForRowInVideo:index] btn2Title:[self.videosVM title2ForRowInVideo:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        VideoDetailPicViewController *vc = [[VideoDetailPicViewController alloc]initWithWebURL:[self.videosVM htmlForRow:index]  btn1URL:[self.videosVM link1URLForRowInVideo:index] btn2URL:[self.videosVM link2URLForRowInVideo:index ]btn1Pic:[self.videosVM previewImage1URLForRow:index] btn2Pic:[self.videosVM previewImage2URLForRow:index] btn1Title:[self.videosVM title1ForRowInVideo:index] btn2Title:[self.videosVM title2ForRowInVideo:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
   // DDLogVerbose(@"%@",[self.videosVM title1ForRowInVideo:index]);
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
