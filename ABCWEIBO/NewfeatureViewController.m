//
//  NewfeatureViewController.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-4.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "NewfeatureViewController.h"
#import "TabBarViewController.h"

@interface NewfeatureViewController ()<UIScrollViewDelegate>

{
    UIPageControl *page;
}

@property (nonatomic, retain) UIScrollView *scroll;

@end

@implementation NewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScroll];
    [self setupPageController];
    
}

- (void)setupScroll
{
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _scroll.delegate = self;
    //整夜翻
    _scroll.pagingEnabled = YES;
    //不支持回弹
    _scroll.bounces = NO;
    //不显示滚动条(水平)
    _scroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scroll];
    [_scroll release];
    _scroll.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height);
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d-568h@2x", i + 1]]];
        imageView.frame = CGRectMake(i * [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [_scroll addSubview:imageView];
        if (i == 2) {
            //设置开始按钮
            UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [imageView addSubview:startButton];
            [self setupStartButton:startButton];
            //设置分享按钮
            UIButton *checkBoxButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [imageView addSubview:checkBoxButton];
            [self setupCheckBoxButton:checkBoxButton];
            imageView.userInteractionEnabled = YES;
        }
        [imageView release];
    }

}

//设置最后一页的开始按钮
- (void)setupStartButton:(UIButton *)button
{
    [button setTitle:@"开始微博" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button@2x"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted@2x"] forState:UIControlStateHighlighted];
    button.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 380);
    button.bounds = CGRectMake(0, 0, button.currentBackgroundImage.size.width,  button.currentBackgroundImage.size.height);
    [button addTarget:self action:@selector(startButton) forControlEvents:UIControlEventTouchUpInside];
}

//开始微博,切换窗口
- (void)startButton
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    TabBarViewController *tv = [[TabBarViewController alloc] init];
    //这种方式直接切换窗口的控制器,好处在于能把原来的新特性控制器直接销毁
    self.view.window.rootViewController = tv;
    [tv release];
    //或者
//    [UIApplication sharedApplication].keyWindow.rootViewController = tv;
}

//设置分享按钮
- (void)setupCheckBoxButton:(UIButton *)button
{
    [button setTitle:@"分享微博" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setImage:[UIImage imageNamed:@"new_feature_share_false@2x"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"new_feature_share_true@2x"] forState:UIControlStateSelected];
    button.selected = YES;
    button.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 340);
    button.bounds = CGRectMake(0, 0, 200, 40);
    [button addTarget:self action:@selector(cheakBoxButton:) forControlEvents:UIControlEventTouchUpInside];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);

}

- (void)cheakBoxButton:(UIButton *)button
{
    button.selected = !button.isSelected;
}

- (void)setupPageController
{
    page = [[UIPageControl alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 100, 500, 200, 30)];
    page.numberOfPages = 3;
    //设置选中原点的颜色(当前)
    page.currentPageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_checked_point@2x"]];
    page.currentPageIndicatorTintColor = [UIColor colorWithRed:253/255. green:98/ 255. blue:42/ 255. alpha:1.0];
    //未选中原点的颜色
    page.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_point@2x"]];
    page.pageIndicatorTintColor = [UIColor colorWithRed: 189 / 255. green: 189 / 255. blue: 189 / 255. alpha:1.0];
    
    [page addTarget:self action:@selector(pageChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:page];


}

- (void)pageChange
{
    self.scroll.contentOffset = CGPointMake(page.currentPage * [UIScreen mainScreen].bounds.size.width, 0);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double pageDouble = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    int pageInt = (int) (pageDouble + 0.5);
    page.currentPage = pageInt;
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
