//
//  CustomTabBar.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-2.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomButton.h"

@interface CustomTabBar()

@property (nonatomic, retain) CustomButton *selectedButton;
@property (nonatomic, retain) UIButton *plusButton;
@property (nonatomic, retain) NSMutableArray *customButtons;

@end
@implementation CustomTabBar


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //添加中间的加号按钮
        self.plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_os7@2x"] forState:UIControlStateNormal];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_os7@2x"] forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted_os7@2x"] forState:UIControlStateHighlighted];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted_os7@2x"] forState:UIControlStateHighlighted];
        self.plusButton.frame = CGRectMake(0, 0, self.plusButton.currentBackgroundImage.size.width, self.plusButton.currentBackgroundImage.size.height);
        [self addSubview:_plusButton];
        self.customButtons = [NSMutableArray array];
    }
    return self;
}

- (void)addbuttonWithTabBarItem:(UITabBarItem *) item
{
    CustomButton *button = [[CustomButton alloc] init];
    button.item = item;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    [self.customButtons addObject:button];
    if (self.customButtons.count == 1) {
        [self buttonClick:button];
    }
}

- (void)buttonClick:(CustomButton *)button
{
    //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didselectedFrom:to:)]) {
        [self.delegate tabBar:self didselectedFrom:self.selectedButton.tag to:button.tag - 100];
    }
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    self.selectedButton.selected = YES;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = [UIScreen mainScreen].bounds.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    for (int i = 0; i < self.customButtons.count; i++) {
        CGFloat buttonX = buttonW * i;
        if (i > 1) {
            buttonX += buttonW;
        }
        CustomButton *button = self.customButtons[i];
        button.tag = 100 + i;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
    
    //调整加号的尺寸
    self.plusButton.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, buttonH * 0.5);
}
@end
