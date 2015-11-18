//
//  VideosDeatilVideoViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideosDeatilVideoViewController : UIViewController
- (instancetype)initWithWebURL:(NSURL *)url
                      videoURL:(NSURL *)videoURL
                 videoImageURL:(NSURL *)picURL
                       btn1URL:(NSURL *)btn1URL
                       btn2URL:(NSURL *)btn2URL
                       btn1Pic:(NSURL *)pic1URL
                       btn2Pic:(NSURL *)pic2URL
                          name:(NSString *)name
                     btn1Title:(NSString *)title1
                     btn2Title:(NSString *)title2;
@property (nonatomic,strong)NSURL *url;
@property (nonatomic,strong)NSURL *videoURL;
@property (nonatomic,strong)NSURL *picURL;
@property (nonatomic,strong)NSURL *btn1URL;
@property (nonatomic,strong)NSURL *btn2URL;
@property (nonatomic,strong)NSURL *pic1URL;
@property (nonatomic,strong)NSURL *pic2URL;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *title1;
@property (nonatomic,strong)NSString *title2;
@end
