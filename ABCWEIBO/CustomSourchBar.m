//
//  CustomSourchBar.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-4.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "CustomSourchBar.h"
#import "UIImage+QM.h"

@implementation CustomSourchBar

+ (CustomSourchBar *)customSourchBar
{
    return [[[CustomSourchBar alloc] init] autorelease];
}

- (id)init
{
    if (self = [super init]) {
        
        //设置背景图片
        self.background = [UIImage resizeImageWithName:@"searchbar_textfield_background_os7"];
//        self.background = [UIImage imageNamed:@"searchbar_textfield_background_os7"];
        //设置左侧的放大镜
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imageView.bounds = CGRectMake(0, 0, 50, 30);
        imageView.contentMode = UIViewContentModeCenter;//图片居中,按原来尺寸
        self.leftView = imageView;
        self.leftViewMode = UITextFieldViewModeAlways;
        //设置搜索框文字已经占位符
        self.placeholder = @"搜索";
        self.font = [UIFont systemFontOfSize:14];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        //设置键盘右下角的样式(sreach)
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;//自动设置右下角的search能不能用,只有输入了东西才能用
    }
    return self;
}

@end
