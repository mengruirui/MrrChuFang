//
//  PhoneReginstViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PhoneReginstViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import <MBProgressHUD.h>

@interface PhoneReginstViewController ()<MBProgressHUDDelegate>
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLb;
@property (weak, nonatomic) IBOutlet UITextField *validationCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation PhoneReginstViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.validationCodeTF becomeFirstResponder];
    self.nextBtn.layer.cornerRadius = 5;
    self.nextBtn.layer.masksToBounds = YES;
    [Factory addBackItemToVC:self];
    self.phoneNumberLb.font = [UIFont boldFlatFontOfSize:17];
    self.phoneNumberLb.text = self.phoneNumber;
    
}
- (IBAction)inputValidationCode:(id)sender {
    [self.passWordTF becomeFirstResponder];
}
- (IBAction)setUpPassWord:(UITextField *)sender {
    [self.passWordTF resignFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//下一步
- (IBAction)nextClick:(id)sender {
    [SMSSDK commitVerificationCode:self.validationCodeTF.text phoneNumber:self.phoneNumber zone:@"86" result:^(NSError *error) {
        if (error) {
          MBProgressHUD  *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.delegate = self;
            //常用的设置
            //小矩形的背景色
            hud.color = [UIColor clearColor];//这儿表示无背景
            //显示的文字
            hud.labelText = error.userInfo[@"commitVerificationCode"];
            //细节文字
            //_HUD.detailsLabelText = error.userInfo[@"getVerificationCode"];
            //是否有庶罩
            hud.dimBackground = YES;
            [hud hide:YES afterDelay:3];
        }
        else
        {
            NSLog(@"验证码正确");
        }
        
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
