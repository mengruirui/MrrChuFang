//
//  LoginDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LoginDetailViewController.h"
#import "userModel.h"

@interface LoginDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextFied;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIButton *weboBtn;
@property (weak, nonatomic) IBOutlet UIButton *qqBtn;
@property (weak, nonatomic) IBOutlet UIButton *doubanBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    [self.weboBtn setBackgroundImage:[UIImage imageNamed:@"S_share_icon_1_s"] forState:(UIControlStateNormal)];
    self.weboBtn.layer.cornerRadius = 25;
    self.weboBtn.layer.masksToBounds = YES;
    [self.qqBtn setBackgroundImage:[UIImage imageNamed:@"S_share_icon_24_s"] forState:(UIControlStateNormal)];
    self.qqBtn.layer.cornerRadius = 25;
    self.qqBtn.layer.masksToBounds = YES;
    [self.doubanBtn setBackgroundImage:[UIImage imageNamed:@"S_share_icon_5_s"] forState:(UIControlStateNormal)];
    self.doubanBtn.layer.cornerRadius = 25;
    self.doubanBtn.layer.masksToBounds = YES;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//登录
- (IBAction)login:(id)sender {
   NSArray *users = [UserModel userListWithUserName:self.userTextFied.text andPassWord:self.passWordTextField.text];
    UserModel *user = users.firstObject;
    if ([user.passWord isEqualToString:self.passWordTextField.text] && [user.userName isEqualToString:self.userTextFied.text]) {
        DDLogVerbose(@"登陆成功");
    }else{
        DDLogVerbose(@"账号或密码错误");
    }
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
