//
//  CommunityCell.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"


@interface CommunityCell : UITableViewCell
@property (nonatomic,strong)TRImageView  *iconIV;
@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *descLb;

@end
