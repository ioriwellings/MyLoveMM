//
//  MMChatViewController.h
//  MM
//
//  Created by xiyang on 16/3/15.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface MMChatViewController : RCConversationViewController

/** 会话数据模型 */
@property (strong, nonatomic) RCConversationModel *conversation;

@end
