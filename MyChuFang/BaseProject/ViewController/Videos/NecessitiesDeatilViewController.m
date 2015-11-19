//
//  NecessitiesDeatilViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NecessitiesDeatilViewController.h"
#import "TRImageView.h"

@interface NecessitiesDeatilViewController ()
@property (nonatomic,strong)TRImageView *iconIV;
@property (nonatomic,strong)TRImageView *fenIV;
@property (nonatomic,strong)UILabel *titleLb;
@property (nonatomic,strong)UILabel *descLb;
@property (nonatomic,strong)UITextView *descTV;
@end

@implementation NecessitiesDeatilViewController
-(instancetype)initWithImageURL:(NSURL *)url name:(NSString *)name desc:(NSString *)desc
{
    if (self = [super init]) {
        _url = url;
        _name = name;
        _desc = desc;
        self.title = name;
    }
    return self;
}
- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        [self.view addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(kWindowW * 415/640);
        }];
    }
    return _iconIV;
}

- (TRImageView *)fenIV {
    if(_fenIV == nil) {
        _fenIV = [[TRImageView alloc] init];
        _fenIV.imageView.image = [UIImage imageNamed:@"分割线"];
        [self.view addSubview:_fenIV];
        [_fenIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(250, 17));
        }];
    }
    return _fenIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.view addSubview:_titleLb];
        _titleLb.font = [UIFont boldFlatFontOfSize:17];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-40);
        }];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.font = [UIFont systemFontOfSize:15];
        _descLb.numberOfLines = 0;
        [self.view addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.fenIV.mas_bottom).mas_equalTo(10);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.right.mas_equalTo(-30);
            //make.bottom.mas_equalTo(-10);
        }];
    }
    return _descLb;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addBackItemToVC:self];
    self.view.backgroundColor = kRGBColor(255, 255, 255);
    [self.iconIV.imageView setImageWithURL:self.url placeholderImage:[UIImage imageNamed:@""]];
    self.titleLb.text = self.name;
    self.descLb.text = self.desc;
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
