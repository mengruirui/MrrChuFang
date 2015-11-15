//
//  MyHomeViewController.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MyHomeViewController.h"


@interface MyHomeViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation MyHomeViewController
-(instancetype)initWithURL:(NSURL *)url
{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}
-(UIWebView *)webView
{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addBackItemToVC:self];
    self.title = @"商品";
    self.webView.hidden = NO;
}

#pragma mark - UIWebView


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
