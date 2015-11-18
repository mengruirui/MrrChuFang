//
//  VideoDetailPicViewController.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoDetailPicViewController.h"
#import "VideoPlayViewController.h"

@interface VideoDetailPicViewController ()<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView *webView;

@property (nonatomic,strong)UIButton *videoBtn1;
@property (nonatomic,strong)UIButton *videoBtn2;
@property (nonatomic,strong)UILabel *titleLb1;
@property (nonatomic,strong)UILabel *titleLb2;

@end

@implementation VideoDetailPicViewController

-(instancetype)initWithWebURL:(NSURL *)url btn1URL:(NSURL *)btn1URL btn2URL:(NSURL *)btn2URL btn1Pic:(NSURL *)pic1URL btn2Pic:(NSURL *)pic2URL btn1Title:(NSString *)title1 btn2Title:(NSString *)title2
{
    if (self = [super init]) {
        _url = url;
        _btn1URL = btn1URL;
        _btn2URL = btn2URL;
        _pic1URL = pic1URL;
        _pic2URL = pic2URL;
        _title1 = title1;
        _title2 = title2;
    }
    return self;

}
-(UIButton *)videoBtn1
{
    if (!_videoBtn1) {
        _videoBtn1 = [UIButton buttonWithType:0];
        _videoBtn1.layer.cornerRadius = 5;
        _videoBtn1.layer.masksToBounds = YES;
        [self.view addSubview:_videoBtn1];
        [_videoBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(12);
            make.right.mas_equalTo(self.videoBtn2.mas_left).mas_equalTo(-10);
            //make.height.mas_equalTo(kWindowW * 194/275);
            make.height.mas_equalTo(50);
        }];
        UIImageView *imageView = [UIImageView new];
        [_videoBtn1 addSubview:imageView];
        imageView.image = [UIImage imageNamed:@"Icon_Video_Play"];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.right.mas_equalTo(-3);
            make.bottom.mas_equalTo(-3);
        }];
        
    }
    return _videoBtn1;
}

-(UILabel *)titleLb1
{
    if (!_titleLb1) {
        _titleLb1 = [UILabel new];
        _titleLb1.font = [UIFont systemFontOfSize:12];
        [self.view addSubview:_titleLb1];
        [_titleLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.videoBtn1);
            make.top.mas_equalTo(self.videoBtn1.mas_bottom).mas_equalTo(5);
            make.rightMargin.mas_equalTo(self.videoBtn1);
        }];
    }
    return _titleLb1;
}


-(UIButton *)videoBtn2
{
    if (!_videoBtn2) {
        _videoBtn2 = [UIButton buttonWithType:0];
        _videoBtn2.layer.cornerRadius = 5;
        _videoBtn2.layer.masksToBounds = YES;
        [self.view addSubview:_videoBtn2];
        [_videoBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.videoBtn1);
            make.right.mas_equalTo(-12);
            make.size.mas_equalTo(self.videoBtn1);
        }];
        UIImageView *imageView = [UIImageView new];
        [_videoBtn2 addSubview:imageView];
        imageView.image = [UIImage imageNamed:@"Icon_Video_Play"];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.right.mas_equalTo(-3);
            make.bottom.mas_equalTo(-3);
        }];
        
    }
    return _videoBtn2;
}
-(UILabel *)titleLb2
{
    if (!_titleLb2) {
        _titleLb2 = [UILabel new];
        _titleLb2.font = [UIFont systemFontOfSize:12];
        [self.view addSubview:_titleLb2];
        [_titleLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.videoBtn2);
            make.top.mas_equalTo(self.videoBtn2.mas_bottom).mas_equalTo(5);
            make.rightMargin.mas_equalTo(self.videoBtn2);
            make.bottomMargin.mas_equalTo(self.titleLb1);
        }];
    }
    return _titleLb2;
}
-(UIWebView *)webView
{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb1.mas_bottom).mas_equalTo(10);
            make.left.right.bottom.mas_equalTo(0);
        }];
        [_webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addBackItemToVC:self];
    self.title = @"制作详情";
    self.view.backgroundColor = kRGBColor(224, 224, 224);
    self.webView.hidden = NO;
    [self.videoBtn1 setBackgroundImageForState:(UIControlStateNormal) withURL:self.pic1URL];
    [self.videoBtn2 setBackgroundImageForState:(UIControlStateNormal) withURL:self.pic2URL];
    
    self.titleLb1.text = self.title1;
    self.titleLb2.text = self.title2;
    
    
    [self.videoBtn1 bk_addEventHandler:^(id sender) {
        VideoPlayViewController *vc = [[VideoPlayViewController alloc]initWithURL:self.btn1URL name:self.title1];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.videoBtn2 bk_addEventHandler:^(id sender) {
        VideoPlayViewController *vc = [[VideoPlayViewController alloc]initWithURL:self.btn2URL name:self.title2];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:(UIControlEventTouchUpInside)];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hideProgress];
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
