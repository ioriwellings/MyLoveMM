//
//  MMUserInfo.h
//  MM
//
//  Created by xiyang on 16/3/21.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>

@interface MMUserInfo : RCUserInfo

/** 全拼*/
@property(nonatomic, strong) NSString* quanPin;
/** email*/
@property(nonatomic, strong) NSString* email;
/**  1 好友, 2 请求添加, 3 请求被添加, 4 请求被拒绝, 5 我被对方删除*/
@property(nonatomic, strong) NSString* status;

@end
