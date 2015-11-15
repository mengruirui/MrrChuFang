//
//  MyHomeViewController.h
//  BaseProject
//
//  Created by 孟瑞瑞 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHomeViewController : UIViewController
- (instancetype)initWithURL:(NSURL *)url;
@property (nonatomic,strong) NSURL *url;
@end
