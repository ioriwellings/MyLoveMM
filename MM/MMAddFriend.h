//
//  MMAddFriend.h
//  MM
//
//  Created by xiyang on 16/3/11.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAddFriend : NSObject

/** 图片 */
@property (copy, nonatomic) NSString *icon;
/** 标题 */
@property (copy, nonatomic) NSString *title;
/** 标题说明 */
@property (copy, nonatomic) NSString *subTitle;
/** 字典转模型 */
+ (instancetype)mmAddriendWithDictionary:(NSDictionary *)dict;

@end
