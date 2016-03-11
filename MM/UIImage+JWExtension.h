//
//  UIImage+JWExtension.h
//  百思不得姐
//
//  Created by 黄进文 on 15/9/8.
//  Copyright (c) 2015年 黄进文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JWExtension)

/**
 *  返回一张圆形的图片
 */
- (instancetype)circleImage;

/**
 *  返回一张圆形的图片
 */

+ (instancetype)circleImageWithName:(NSString *)name;
@end
