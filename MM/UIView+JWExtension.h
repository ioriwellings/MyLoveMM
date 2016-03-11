//
//  UIView+JWExtension.h
//  百思不得姐
//
//  Created by 黄进文 on 15/9/9.
//  Copyright (c) 2015年 黄进文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JWExtension)
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;

/** 从xib中创建一个工具条 */
+ (instancetype)viewFromXib;
@end
