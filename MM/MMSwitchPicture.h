//
//  MMSwitchPicture.h
//  MM
//
//  Created by xiyang on 16/4/13.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSwitchPicture : UIView

@property (strong, nonatomic) UIView *backView;

/** 背景图片 */
@property (strong, nonatomic) UIImageView *backImageView;

/** 下一张图片 */
@property (assign, nonatomic) NSInteger index;

/** 背景图的下标 */
@property (assign, nonatomic) NSInteger backIndex;

/**
 * 网络图片地址
 */
@property (strong, nonatomic) NSArray *urlArray;

/**
 * 是否循环播放
 */
@property (assign, nonatomic) BOOL isLoop;

/**
 * 播放结束之后的背景图片
 * 如果是循环播放不用设置
 */
@property (strong, nonatomic) NSString *backUrl;

/**
 * 加载数据
 */
- (void)setData;

@end
