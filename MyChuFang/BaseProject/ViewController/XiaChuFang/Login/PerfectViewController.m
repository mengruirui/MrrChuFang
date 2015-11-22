//
//  PerfectViewController.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PerfectViewController.h"
#import "XiaChuFangTableViewController.h"

@interface PerfectViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *headBtn;

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIButton *completeBtn;
@end

@implementation PerfectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[Factory addBackItemToVC:self];
    self.title = @"完善资料";
    self.completeBtn.layer.cornerRadius = 5;
    self.completeBtn.layer.masksToBounds = YES;
    [self.headBtn setBackgroundImage:[UIImage imageNamed:@"head"] forState:(UIControlStateNormal)];
    self.headBtn.layer.cornerRadius = 90/2;
    self.headBtn.layer.masksToBounds = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]bk_initWithTitle:@"跳过" style:(UIBarButtonItemStyleDone) handler:^(id sender) {
        
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = [AppDelegate new].sideMenu;
#warning 跳过去后为 Yes
       //跳过去后登录状态为 YES
    }];
    self.navigationItem.rightBarButtonItem.tintColor = kRGBColor(255, 96, 0);
    self.navigationItem.hidesBackButton = YES;
    [self.headBtn bk_addEventHandler:^(id sender) {
        
        //步骤1：在百度搜索 “iOS 读取系统相册”， 获取读取相册使用的类
        //步骤2：到类的头文件中查看是否有专属的初始化方法，如没有，则new
        UIImagePickerController *pc = [UIImagePickerController new];
        pc.delegate = self;
        //开启编辑功能
        pc.allowsEditing = YES;
        //可以定义要选取的数据类型，默认只显示图片
        pc.mediaTypes=@[(NSString *) kUTTypeMovie, (NSString *)kUTTypeImage];
        //输入源选择--默认是相册
        // pc.sourceType = UIImagePickerControllerSourceTypeCamera;
        pc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //可以添加蒙层
        UIView *redView = [UIView new];
        redView.backgroundColor = [UIColor redColor];
        redView.alpha = 0.4;
        //pc.cameraOverlayView = redView;
        redView.frame = CGRectMake(0, 0, 375, 500);
        
        [self presentViewController:pc animated:YES completion:nil];
        
    } forControlEvents:(UIControlEventTouchUpInside)];
}


#pragma mark UIImagePickerController
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //通过断点，查询info中的数据。确定OriginalImage 这个key中是我们想要的数据
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    //获取编辑后的图片
    image = info[UIImagePickerControllerEditedImage];
    [self.headBtn setBackgroundImage:image forState:(UIControlStateNormal)];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)completeClick:(id)sender {
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [AppDelegate new].sideMenu;
    #warning 跳过去后为 Yes
    //跳过去后登录状态为 YES
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
