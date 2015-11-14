//
//  BazaarViewDeatilController.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BazaarViewDeatilController.h"
#import "BazaarViewController.h"
@interface BazaarViewDeatilController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation BazaarViewDeatilController

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
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
    self.title=@"商品详情";
    [self.webView loadRequest:_request];
}
- (id)initWithRequest:(NSURLRequest *)request{
    if (self=[super init]) {
        self.request = request;
        //推出来 不显示下方栏
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
#pragma mark -
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (navigationType != 5) {
        BazaarViewDeatilController *detailVC=[[BazaarViewDeatilController alloc] initWithRequest:request];
        [self.navigationController pushViewController:detailVC animated:YES];
        return NO;
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
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
