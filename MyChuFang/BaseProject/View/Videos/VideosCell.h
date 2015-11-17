//
//  VideosCell.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PSCollectionViewCell.h"
#import "TRImageView.h"

@interface VideosCell : PSCollectionViewCell
@property (nonatomic,strong)TRImageView *iconIV;
@property (nonatomic,strong)UILabel *titleLb;
@property (nonatomic,strong)UILabel *descLb;
@property (nonatomic,strong)TRImageView *videoIV;

@end
