//
//  UIImage+JWExtension.m
//  百思不得姐
//
//  Created by 黄进文 on 15/9/8.
//  Copyright (c) 2015年 黄进文. All rights reserved.
//

#import "UIImage+JWExtension.h"

@implementation UIImage (JWExtension)

- (instancetype)circleImage {
    
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    // 获取图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 画一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ref, rect);
    // 裁剪
    CGContextClip(ref);
    // 往圆上画上一张图片
    [self drawInRect:rect];
    // 获得上下文的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)circleImageWithName:(NSString *)name {
    
    return [[self imageNamed:name] circleImage];
}


@end
