//
//  UIBarButtonItem+MQ.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-4.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "UIBarButtonItem+MQ.h"

@implementation UIBarButtonItem (MQ)

+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon highlihtedIcon:(NSString *)highligntedIcon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highligntedIcon] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return [barButtonItem autorelease];
}

@end
