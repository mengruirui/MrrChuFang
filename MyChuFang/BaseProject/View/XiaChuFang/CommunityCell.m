//
//  CommunityCell.m
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CommunityCell.h"

@implementation CommunityCell

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(2);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-50);
        }];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(8);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.bottom.mas_equalTo(-17);
            make.right.mas_equalTo(-5);
        }];
    }
    return _descLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.separatorInset = UIEdgeInsetsMake(0, 72, 0, 0);
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
