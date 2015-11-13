//
//  WeekCell.h
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface WeekCell : UITableViewCell
@property (nonatomic,strong)TRImageView *iconIV;
@property (nonatomic,strong)UILabel *nameLb;
@property (nonatomic,strong)UILabel *scoreLb;
@property (nonatomic,strong)UILabel *cookedLb;
@property (nonatomic,strong)UILabel *authorLb;
@property (nonatomic,strong)TRImageView *authIV;
@end
