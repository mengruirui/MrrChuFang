//
//  WelcomeViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WelcomeViewController.h"
#import "TRImageView.h"
#import "iCarousel.h"
#import "AppDelegate.h"
@interface WelcomeViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)NSArray *imageNames;
@property (nonatomic,strong)iCarousel *ic;
@property (nonatomic,strong)UIPageControl *pageControl;

@end

@implementation WelcomeViewController
-(NSArray *)imageNames
{
    if (!_imageNames) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"images" ofType:@"bundle"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        _imageNames = [fileManager subpathsAtPath:path];
    }
    return _imageNames;
}
-(UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [UIPageControl new];
        _pageControl.numberOfPages = self.imageNames.count;
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.userInteractionEnabled = NO;
        [self.view addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-20);
        }];
    }
    return _pageControl;
}
-(iCarousel *)ic
{
    if (!_ic) {
        _ic = [iCarousel new];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.pagingEnabled = YES;
        _ic.type = 3;
        _ic.scrollSpeed = 1;
        _ic.bounces = NO;
        [self.view addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _ic;
}

#pragma mark - iCarousel
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return NO;//type 0 的默认循环滚动模式是否
    }
    //修改缝隙
    if (option == iCarouselOptionSpacing) {
        return value * 1;
    }
    //取消后背的显示
    if (option == iCarouselOptionShowBackfaces) {
        return NO;
    }
    return value;
}

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.imageNames.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
        TRImageView *imageView = [TRImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        UIButton *btn = [UIButton buttonWithType:0];
        btn.tag = 200;
        [view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(120, 40));
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-20);
        }];
    }
    TRImageView *imageView = (TRImageView *)[view viewWithTag:100];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"images" ofType:@"bundle"];
    
    path = [path stringByAppendingPathComponent:self.imageNames[index]];
    imageView.imageView.image = [UIImage imageWithContentsOfFile:path];
    if (index == [self.imageNames indexOfObject:self.imageNames.lastObject]) {
        UIButton *btn = (UIButton *)[view viewWithTag:200];
        [btn setTitleColor:kRGBColor(244, 78, 63) forState:(UIControlStateNormal)];
        [btn setTitle:@"进入My厨房" forState:(UIControlStateNormal)];
        FBShimmeringView *sv = [FBShimmeringView new];
        [view addSubview:sv];
        [sv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(150, 80));
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-30);
        }];
        sv.contentView = btn;
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
            
        }];
        sv.shimmering = YES;
        [btn bk_addEventHandler:^(id sender) {
           UIWindow * window = [UIApplication sharedApplication].keyWindow;
            window.rootViewController = [AppDelegate new].sideMenu;
        } forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    
    return view;
}
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.pageControl.currentPage = carousel.currentItemIndex;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.ic reloadData];
    self.pageControl.hidden = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
