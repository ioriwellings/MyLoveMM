//
//  MMRequestBLL.h
//  MM
//
//  Created by xiyang on 16/3/16.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MMREQUESTBLL [MMRequestBLL shareInstance]

@interface MMRequestBLL : NSObject

/** MMRequestBLL单例 */
+ (MMRequestBLL *)shareInstance;

/** 获取用户的TokenID */
- (void)requestGetUserTokenIDWithUserID:(NSString *)userID withUserName:(NSString *)userName success:(void(^)(NSMutableDictionary *dictionary))success fail:(void(^)(NSError *error))fail;

@end
