//
//  CustomNavigationController.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-3.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//第一次使用这个类时,调用(一个类只调用一次)
+ (void)initialize
{
    //设置导航栏主题
    [self setupNavTheme];
    
    //设置导航栏两侧按钮文字
    [self setBarItem];
}

//设置两侧按钮文字
+ (void)setBarItem
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor], NSFontAttributeName : [UIFont systemFontOfSize:17]} forState:UIControlStateNormal];
}

//设置主题文字
+ (void)setupNavTheme
{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:19]};
}

//重写push方法,一旦调用push方法就隐藏底部的导航控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //如果是第几个控制器入栈,不执行隐藏(栈低已经有控制器了,再入栈的就隐藏)
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

@end
