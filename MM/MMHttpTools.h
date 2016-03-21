//
//  MMHttpTools.h
//  MM
//
//  Created by xiyang on 16/3/16.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MMHTTPTOOLS [MMHttpTools shareInstance]

@interface MMHttpTools : NSObject

/** 所有好友 */
@property (strong, nonatomic) NSMutableArray *allFriends;

/** 所有群组 */
@property (strong, nonatomic) NSMutableArray *allGroups;

/** MMHttpTools单例 */
+ (MMHttpTools *)shareInstance;

/** 获取用户个人信息 */
- (void)getUserInfoWithUserID:(NSString *)userID
                   completion:(void (^)(RCUserInfo *user))completion;

/** 按昵称搜索好友 */
- (void)searchFriendListByName:(NSString *)name
                      complete:(void (^)(NSMutableArray *result))friendList;
/** 按邮箱搜索好友 */
- (void)searchFriendListByEmail:(NSString *)email
                       complete:(void (^)(NSMutableArray *result))friendList;

/** sha1数据校验 */
- (NSString *)sha1:(NSString *)input;
@end
