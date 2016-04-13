//
//  MMMouseTouch.h
//  MM
//
//  Created by xiyang on 16/4/13.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMMouseTouch : UIView


// 给定一个触摸的位置 在整个屏幕散圆
+ (instancetype)viewWithCicle:(CGRect)rect;

- (instancetype)initWithFrame:(CGRect)frame;


@end
