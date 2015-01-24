//
//  CustomTabBar.h
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-2.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomTabBar;

@protocol CustomTabBarDelegate <NSObject>

- (void)tabBar:(CustomTabBar *)tabBar didselectedFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface CustomTabBar : UIView

@property (nonatomic, retain) UITabBarItem *item;
@property (nonatomic, assign) id<CustomTabBarDelegate>delegate;

- (void)addbuttonWithTabBarItem:(UITabBarItem *) item;

@end
