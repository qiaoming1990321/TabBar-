//
//  CustomHomeButton.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-4.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "CustomHomeButton.h"
#import "UIImage+QM.h"

@implementation CustomHomeButton

- (id)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        //高亮状态不自动调整图片
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeCenter;//居中
        [self setBackgroundImage:[UIImage resizeImageWithName:@"navigationbar_filter_background_highlighted_os7@2x"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(contentRect.size.width - 20 , 0, 20, contentRect.size.height);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width - 20, contentRect.size.height);
}

@end
