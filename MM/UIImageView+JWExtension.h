//
//  UIImageView+JWExtension.h
//  百思不得姐
//
//  Created by 黄进文 on 15/9/8.
//  Copyright (c) 2015年 黄进文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (JWExtension)

/** 传图片的URL */
- (void)setHeaderURLWithString:(NSString *)url placeholderWithName:(NSString *)name;

/** 直接传图片名 */
- (void)setHeaderWithPictureName:(NSString *)pictureName;

/** 切半径的一半为一个圆 */
- (void)cutRadiusToCircleWithImage:(NSString *)image;

@end