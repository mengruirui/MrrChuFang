//
//  VideoPlayViewController.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoPlayViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface VideoPlayViewController ()

@end

@implementation VideoPlayViewController
//为了保证同一时间只有一个播放器,使用单利模式
+ (AVPlayerViewController *)sharedInstance
{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}
-(instancetype)initWithURL:(NSURL *)url name:(NSString *)name
{
    if (self = [super init]) {
        self.url = url;
        self.title = name;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addBackItemToVC:self];
    
    AVPlayer *player = [AVPlayer playerWithURL:self.url];
    [player play];
    [VideoPlayViewController sharedInstance].player = player;
    [self.view addSubview:[VideoPlayViewController sharedInstance].view];
    [[VideoPlayViewController sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];

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
