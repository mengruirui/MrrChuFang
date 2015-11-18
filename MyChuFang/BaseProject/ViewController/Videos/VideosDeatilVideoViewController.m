//
//  VideosDeatilVideoViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosDeatilVideoViewController.h"

@interface VideosDeatilVideoViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong)UIButton *videoBtn0;
@property (nonatomic,strong)UIButton *videoBtn1;
@property (nonatomic,strong)UIButton *videoBtn2;
@property (nonatomic,strong)UILabel *titleLb0;
@property (nonatomic,strong)UILabel *titleLb1;
@property (nonatomic,strong)UILabel *titleLb2;
@end

@implementation VideosDeatilVideoViewController
-(instancetype)initWithWebURL:(NSURL *)url videoURL:(NSURL *)videoURL videoImageURL:(NSURL *)picURL btn1URL:(NSURL *)btn1URL btn2URL:(NSURL *)btn2URL btn1Pic:(NSURL *)pic1URL btn2Pic:(NSURL *)pic2URL name:(NSString *)name btn1Title:(NSString *)title1 btn2Title:(NSString *)title2
{
    if (self = [super init]) {
        _url = url;
        _videoURL = videoURL;
        _picURL = picURL;
        _btn1URL = btn1URL;
        _btn2URL = btn2URL;
        _pic1URL = pic1URL;
        _pic2URL = pic2URL;
        _name = name;
        _title1 = title1;
        _title2 = title2;
    }
    return self;
}
-(UIButton *)videoBtn0
{
    if (!_videoBtn0) {
        _videoBtn0 = [UIButton buttonWithType:0];
        _videoBtn0.layer.cornerRadius = 5;
        _videoBtn0.layer.masksToBounds = YES;
        [self.view addSubview:_videoBtn0];
        [_videoBtn0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(25);
            make.left.mas_equalTo(12);
            make.right.mas_equalTo(-12);
            make.height.mas_equalTo(kWindowW * 410/584);
        }];
        UIImageView *imageView = [UIImageView new];
        [_videoBtn0 addSubview:imageView];
        imageView.image = [UIImage imageNamed:@"Icon_Video_Play"];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 35));
            make.right.mas_equalTo(-3);
            make.bottom.mas_equalTo(-3);
        }];
    }
    return _videoBtn0;
}
-(UILabel *)titleLb0
{
    if (!_titleLb0) {
        _titleLb0 = [UILabel new];
        [self.view addSubview:_titleLb0];
        [_titleLb0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.videoBtn0);
            make.top.mas_equalTo(self.videoBtn0.mas_bottom).mas_equalTo(5);
            make.rightMargin.mas_equalTo(self.videoBtn0);
        }];
    }
    return _titleLb0;
}
-(UIButton *)videoBtn1
{
    if (!_videoBtn1) {
        _videoBtn1 = [UIButton buttonWithType:0];
        _videoBtn1.layer.cornerRadius = 5;
        _videoBtn1.layer.masksToBounds = YES;
        [self.view addSubview:_videoBtn1];
        [_videoBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb0.mas_bottom).mas_equalTo(40);
            make.leftMargin.mas_equalTo(self.videoBtn0);
            make.right.mas_equalTo(self.videoBtn2.mas_left).mas_equalTo(-10);
            make.height.mas_equalTo(kWindowW * 194/275);
        }];
        UIImageView *imageView = [UIImageView new];
        [_videoBtn1 addSubview:imageView];
        imageView.image = [UIImage imageNamed:@"Icon_Video_Play"];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 35));
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
            make.rightMargin.mas_equalTo(self.videoBtn0);
            make.size.mas_equalTo(self.videoBtn1);
        }];
        UIImageView *imageView = [UIImageView new];
        [_videoBtn2 addSubview:imageView];
        imageView.image = [UIImage imageNamed:@"Icon_Video_Play"];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 35));
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
        _titleLb2.textColor = [UIColor redColor];
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
    self.view.backgroundColor = kRGBColor(224, 224, 224);
    self.webView.hidden = NO;
    [self.videoBtn0 setBackgroundImageForState:(UIControlStateNormal) withURL:self.picURL];
    [self.videoBtn1 setBackgroundImageForState:(UIControlStateNormal) withURL:self.pic1URL];
    [self.videoBtn2 setBackgroundImageForState:(UIControlStateNormal) withURL:self.pic2URL];
    
    self.titleLb0.text = self.name;
    self.titleLb1.text = self.title1;
    self.titleLb2.text = self.title2;
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];
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
