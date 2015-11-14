//
//  BazaarViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BazaarViewController.h"
#import "BazaarViewDeatilController.h"

@interface BazaarViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;

@end

@implementation BazaarViewController
-(UIWebView *)webView
{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
        NSString *path = @"https://www.xiachufang.com/page/ec-tab/?version=12";
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
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
    [Factory addMenuItemToVC:self];
    self.webView.hidden = NO;
    
    
    
}
//如果返回NO，则不会加载请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击web中任意一项，跳转到下一页
    //如果当前webview加载的请求 不是当前页面的
    NSString *path=@"https://www.xiachufang.com/page/ec-tab/?version=12";
    if (![request.URL.absoluteString isEqualToString:path]) {
        BazaarViewDeatilController *vc=[[BazaarViewDeatilController alloc] initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    return YES;
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
