//
//  VideoDetailPicViewController.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoDetailPicViewController : UIViewController


- (instancetype)initWithWebURL:(NSURL *)url
                       btn1URL:(NSURL *)btn1URL
                       btn2URL:(NSURL *)btn2URL
                       btn1Pic:(NSURL *)pic1URL
                       btn2Pic:(NSURL *)pic2URL
                     btn1Title:(NSString *)title1
                     btn2Title:(NSString *)title2;
@property (nonatomic,strong)NSURL *url;
@property (nonatomic,strong)NSURL *btn1URL;
@property (nonatomic,strong)NSURL *btn2URL;
@property (nonatomic,strong)NSURL *pic1URL;
@property (nonatomic,strong)NSURL *pic2URL;
@property (nonatomic,strong)NSString *title1;
@property (nonatomic,strong)NSString *title2;

@end
