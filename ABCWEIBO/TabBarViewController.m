//
//  TabBarViewController.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-2.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "MesssageViewController.h"
#import "DisViewController.h"
#import "MeViewController.h"
#import "CustomTabBar.h"
#import "CustomNavigationController.h"

@interface TabBarViewController ()<CustomTabBarDelegate>

@property (nonatomic, retain) CustomTabBar *customTabBar;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化tabBar
    [self setTabBar];
    //初始化自控制器
    [self setChildViewController];
    
   
}

//移除系统自带的tabbar上的控件
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }

}

//监听按钮的点击位置,切换导航控制器
- (void)tabBar:(CustomTabBar *)tabBar didselectedFrom:(NSInteger)from to:(NSInteger)to;
{
    self.selectedIndex = to;
}

- (void)setTabBar
{
    self.customTabBar = [[CustomTabBar alloc] init];
    _customTabBar.frame = self.tabBar.bounds;
    _customTabBar.delegate = self;
    [self.tabBar addSubview:_customTabBar];
    [_customTabBar release];
}

- (void)setChildViewController
{
    HomeViewController *home = [[HomeViewController alloc] init];
    //设置提醒数字
    home.tabBarItem.badgeValue = @"4";
    
    [self setNavigationControllerWithViewController:home title:@"首页" imageName:@"tabbar_home_os7@2x" selectedImageName:@"tabbar_home_selected_os7@2x"];
    [home release];
    
    MesssageViewController *message = [[MesssageViewController alloc] init];
    message.tabBarItem.badgeValue = @"100";
    
    [self setNavigationControllerWithViewController:message title:@"消息" imageName:@"tabbar_message_center_os7@2x" selectedImageName:@"tabbar_message_center_selected_os7@2x"];
    
    [message release];
    
    DisViewController *dis = [[DisViewController alloc] init];
    [self setNavigationControllerWithViewController:dis title:@"广场" imageName:@"tabbar_discover_os7@2x" selectedImageName:@"tabbar_discover_selected_os7@2x"];
    [dis release];
    
    MeViewController *me = [[MeViewController alloc] init];
    [self setNavigationControllerWithViewController:me title:@"我" imageName:@"tabbar_profile_os7@2x" selectedImageName:@"tabbar_profile_selected_os7@2x"];
    [me release];
    
}

- (void)setNavigationControllerWithViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    //不渲染
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CustomNavigationController *nav = [[CustomNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    [nav release];
    
    //给自定义tarbar的item赋值
    [self.customTabBar addbuttonWithTabBarItem:childVc.tabBarItem];
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
