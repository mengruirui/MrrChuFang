//
//  VideoPlayViewController.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoPlayViewController : UIViewController
-(instancetype)initWithURL:(NSURL *)url name:(NSString *)name;
@property (nonatomic,strong) NSURL *url;
@end
