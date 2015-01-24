//
//  CustomButton.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-2.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "CustomButton.h"
#import "UIImage+QM.h"
#import "CustomBadgeButton.h"

@interface CustomButton()

@property (nonatomic, retain) CustomBadgeButton *badgeButton;


@end

@implementation CustomButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        
        //设置badgeButton
        self.badgeButton = [CustomBadgeButton buttonWithType:UIButtonTypeCustom];
        //按钮往左边拉,往下边拉,离右边和上边有一定间距(使用与一开始按钮frame为0,以后有值了,跟着浮动)
        _badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:_badgeButton];
        

        
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageH = contentRect.size.height * 0.6;
    CGFloat imageW = contentRect.size.width;
    return CGRectMake(0, 0, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleH = contentRect.size.height * 0.4;
    CGFloat titleW = contentRect.size.width;
    return CGRectMake(0, contentRect.size.height - titleH, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item
{
    if (_item != item) {
        [_item release];
        _item = [item retain];
    }

    //KVO监听属性值的改变(当按钮被销毁的时候,要移除监听)
    [_item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [_item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [_item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [_item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //设置title和image
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    
   
    //设置提醒数字
    /*
    if (self.item.badgeValue) {
        _badgeButton.hidden = NO;
        [_badgeButton setTitle:self.item.badgeValue forState:UIControlStateNormal];
        _badgeButton.titleLabel.font = [UIFont systemFontOfSize:11];
        if (self.item.badgeValue.length == 1) {
            //如果内容长度为1,不进行拉伸
            CGFloat badgeW = _badgeButton.currentBackgroundImage.size.width;
            CGFloat badgeX = self.frame.size.width - badgeW - 10;
            CGFloat badgeH = _badgeButton.currentBackgroundImage.size.height;
            CGFloat badgeY = 5;
            _badgeButton.frame = CGRectMake(badgeX, badgeY, badgeW, badgeH);
        } else {
            //得到文字的宽度
            CGSize size = [self.item.badgeValue sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11]}];
            //设置frame
            CGFloat badgeY = 5;
            CGFloat badgeW = size.width + 10;
            CGFloat badgeX = self.frame.size.width - badgeW - 10;
            CGFloat badgeH = _badgeButton.currentBackgroundImage.size.height;
            _badgeButton.frame = CGRectMake(badgeX, badgeY, badgeW, badgeH);
        }
    } else {
        _badgeButton.hidden = YES;
    }
    */
    
    //设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;
    //设置提醒数字的frame
    self.badgeButton.frame = CGRectMake(self.frame.size.width - self.badgeButton.frame.size.width - 0, 5, self.badgeButton.frame.size.width, self.badgeButton.frame.size.height);
    
}

//移除监听
- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
    self.item = nil;
    self.badgeButton = nil;
    [super dealloc];
}


@end
