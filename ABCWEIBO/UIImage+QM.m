//
//  UIImage+QM.m
//  ABCWEIBO
//
//  Created by lanouhn on 15-1-3.
//  Copyright (c) 2015年 qiaoming. All rights reserved.
//

#import "UIImage+QM.h"

@implementation UIImage (QM)

//返回一张可以自由拉伸的图片
+ (UIImage *)resizeImageWithName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
