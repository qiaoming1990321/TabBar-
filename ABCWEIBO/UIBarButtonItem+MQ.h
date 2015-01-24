//
//  UIBarButtonItem+MQ.h
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-4.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MQ)

+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon highlihtedIcon:(NSString *)highligntedIcon target:(id)target action:(SEL)action;

@end
