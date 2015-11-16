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


@interface VideosViewController ()
@property (nonatomic,strong) VideosViewModel *videosVM;
@property (nonatomic,strong) UICollectionView *collectionView;
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
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"食谱";
    [self.videosVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self.collectionView reloadData];
        
       
        
        
        
    }];
    [self.videosVM isVideoForRow:2];
     NSString *title = [self.videosVM packagesTitleForRow:1];
    DDLogVerbose(@"title:%@",title);

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
