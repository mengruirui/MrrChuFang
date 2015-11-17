//
//  VideosCell.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosCell.h"

@implementation VideosCell

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        [self addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2 - 12, 285));
            make.top.left.right.mas_equalTo(0);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.numberOfLines = 0;
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(5);
            make.leftMargin.mas_equalTo(self.iconIV.mas_leftMargin).mas_equalTo(8);
            make.right.mas_equalTo(-8);
        }];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.font = [UIFont systemFontOfSize:13];
        _descLb.textColor = [UIColor lightGrayColor];
        [self addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
    }
    return _descLb;
}

- (TRImageView *)videoIV {
    if(_videoIV == nil) {
        _videoIV = [[TRImageView alloc] init];
    }
    return _videoIV;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
