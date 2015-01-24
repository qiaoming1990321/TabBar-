//
//  CustomBadgeButton.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-3.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "CustomBadgeButton.h"
#import "UIImage+QM.h"

@implementation CustomBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.hidden = YES;
        [self setBackgroundImage:[UIImage resizeImageWithName:@"main_badge_os7@2x"] forState:UIControlStateNormal];
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    if (_badgeValue != badgeValue) {
        [_badgeValue release];
        _badgeValue = [badgeValue retain];
    }
    if (self.badgeValue) {
        self.hidden = NO;
        [self setTitle:self.badgeValue forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        if (self.badgeValue.length == 1) {
            //如果内容长度为1,不进行拉伸
            CGFloat badgeW = self.currentBackgroundImage.size.width;
            CGFloat badgeH = self.currentBackgroundImage.size.height;
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, badgeW, badgeH);
        } else {
            //得到文字的宽度
            CGSize size = [self.badgeValue sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]}];
            //设置frame
            CGFloat badgeW = size.width + 10;
            CGFloat badgeH = self.currentBackgroundImage.size.height;
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, badgeW, badgeH);
        }
    } else {
        self.hidden = YES;
    }
}

@end
