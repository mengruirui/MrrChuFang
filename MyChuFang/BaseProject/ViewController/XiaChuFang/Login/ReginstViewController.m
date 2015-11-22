//
//  ReginstViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReginstViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import "PhoneReginstViewController.h"
#define kToastDuration     1
@interface ReginstViewController ()<MBProgressHUDDelegate>
@property (weak, nonatomic) IBOutlet UITextField *homeTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *vBtn;
@property (nonatomic,strong)MBProgressHUD *hud;
@end

@implementation ReginstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.vBtn.layer.cornerRadius = 5;
    self.vBtn.layer.masksToBounds = YES;
    self.navigationController.navigationBar.hidden = NO;
    self.homeTextField.userInteractionEnabled = NO;
}
//收取验证码
- (IBAction)verificationCharge:(id)sender {
    [SMSSDK getVerificationCodeByMethod:(SMSGetCodeMethodSMS) phoneNumber:self.phoneTextField.text zone:@"86" customIdentifier: nil result:^(NSError *error) {
       /* if (error) {
            _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            _hud.delegate = self;
            //常用的设置
            //小矩形的背景色
            _hud.color = [UIColor clearColor];//这儿表示无背景
            //显示的文字
            _hud.labelText = error.userInfo[@"getVerificationCode"];
            //细节文字
            //_hud.detailsLabelText = error.userInfo[@"getVerificationCode"];
            //是否有庶罩
            _hud.dimBackground = YES;
            [_hud hide:YES afterDelay:3];
            

        }
        else
        {*/
//            [self showSuccessMsg:@"验证码发送成功"];
//            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//                        hud.mode = MBProgressHUDModeText;
//                        hud.labelText = @"验证码发送成功";
//                        hud.margin = 10.f;
//                        hud.yOffset = 150.f;
//                        hud.removeFromSuperViewOnHide = YES;
//                        [hud hide:YES afterDelay:3];
            PhoneReginstViewController *vc = kVCFromSb(@"PhoneReginstViewController", @"Main");
            vc.phoneNumber = self.phoneTextField.text;
            [self.navigationController pushViewController:vc animated:YES];
        //}
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)home:(id)sender {
    [self.phoneTextField becomeFirstResponder];
    
}
- (IBAction)phone:(id)sender {
    [sender resignFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
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
