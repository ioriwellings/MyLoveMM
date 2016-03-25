//
//  MMDidJoinGroupViewController.h
//  MM
//
//  Created by xiyang on 16/3/24.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  EditNickNameInGroup @"EditNickNameInGroup"
#define  EditGroupIntroduce @"EditGroupIntroduce"
#define  EditGroupName @"EditGroupName"

/**
 *  定义block
 *
 *  @param isSuccess isSuccess description
 */
typedef void (^clearMessageCompletion)(BOOL isSuccess);

@class MMGroupInfo;
@interface MMDidJoinGroupViewController : UIViewController

/**
 *  清除历史消息后，会话界面调用roload data
 */
@property(nonatomic, copy) clearMessageCompletion clearHistoryCompletion;

@property (copy, nonatomic) void (^updateGroupInfoBlock)();

/** 初始化 */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withGroupInfo:(MMGroupInfo *)groupInfo;


@end
