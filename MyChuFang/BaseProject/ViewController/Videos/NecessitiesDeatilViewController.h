//
//  NecessitiesDeatilViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NecessitiesDeatilViewController : UIViewController
- (instancetype)initWithImageURL:(NSURL *)url name:(NSString *)name desc:(NSString *)desc;
@property (nonatomic,strong)NSURL *url;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *desc;
@end
