//
//  LoginDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LoginDetailViewController.h"

@interface LoginDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextFied;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIButton *weboBtn;
@property (weak, nonatomic) IBOutlet UIButton *qqBtn;
@property (weak, nonatomic) IBOutlet UIButton *doubanBtn;

@end

@implementation LoginDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    [self.weboBtn setBackgroundImage:[UIImage imageNamed:@"xinlang"] forState:(UIControlStateNormal)];
    [self.qqBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:(UIControlStateNormal)];
    [self.doubanBtn setBackgroundImage:[UIImage imageNamed:@"dou"] forState:(UIControlStateNormal)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//登录
- (IBAction)login:(id)sender {
    
}
//短信登录
- (IBAction)loginSMS:(id)sender {
}
//登录出现问题
- (IBAction)problem:(id)sender {
    
}
//微博
- (IBAction)weibo:(id)sender {
    
}
//QQ

- (IBAction)qq:(id)sender {
    
}
//豆瓣
- (IBAction)douban:(id)sender {
    
}
//用户名
- (IBAction)userTextField:(UITextField *)sender {
    [self.passWordTextField becomeFirstResponder];
}
//密码

- (IBAction)passWordTextField:(UITextField *)sender {
    [sender resignFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//返回
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
