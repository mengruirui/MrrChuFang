//
//  WeekCell.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WeekCell.h"

@implementation WeekCell

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(12);
            make.right.bottom.mas_equalTo(-12);
            make.height.mas_equalTo(kWindowW *364/578);
        }];
    }
    return _iconIV;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont boldFlatFontOfSize:20];
        _nameLb.textColor = kRGBColor(245, 245, 245);
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.scoreLb.mas_top).mas_equalTo(-9);
            make.leftMargin.mas_equalTo(self.scoreLb.mas_leftMargin);
            make.right.mas_equalTo(-20);
        }];
    
    }
    return _nameLb;
}

- (UILabel *)scoreLb {
    if(_scoreLb == nil) {
        _scoreLb = [[UILabel alloc] init];
        _scoreLb.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_scoreLb];
        [_scoreLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.iconIV.mas_leftMargin).mas_equalTo(6);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-4);
        }];
    }
    return _scoreLb;
}

- (UILabel *)cookedLb {
    if(_cookedLb == nil) {
        _cookedLb = [[UILabel alloc] init];
        _cookedLb.textColor = [UIColor whiteColor];
        _cookedLb.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_cookedLb];
        [_cookedLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.scoreLb.mas_right).mas_equalTo(3);
            make.bottomMargin.mas_equalTo(self.scoreLb.mas_bottomMargin);
            
        }];
    }
    return _cookedLb;
}

- (UILabel *)authorLb {
    if(_authorLb == nil) {
        _authorLb = [[UILabel alloc] init];
        _authorLb.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_authorLb];
        [_authorLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.cookedLb.mas_bottomMargin);
            make.rightMargin.mas_equalTo(self.iconIV.mas_rightMargin).mas_equalTo(-6);
        }];
    }
    return _authorLb;
}
-(TRImageView *)authIV
{
    if (!_authIV) {
        _authIV = [TRImageView new];
        _authIV.layer.cornerRadius = 35/2;
        [self.contentView addSubview:_authIV];
        [_authIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.rightMargin.mas_equalTo(self.nameLb.mas_rightMargin);
            make.bottom.mas_equalTo(self.authorLb.mas_top).mas_equalTo(-6);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
    }
    return _authIV;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kRGBColor(245, 245, 236);
    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
