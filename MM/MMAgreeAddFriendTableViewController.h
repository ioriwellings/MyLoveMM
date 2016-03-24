//
//  MMAgreeAddFriendTableViewController.h
//  MM
//
//  Created by xiyang on 16/3/23.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMAgreeAddFriendTableViewController : UITableViewController

/**
 *  targetId
 */
@property (strong, nonatomic) NSString *targetId;

/**
 *  targetName
 */
@property(nonatomic, strong) NSString *userName;
/**
 *  conversationType
 */
@property(nonatomic) RCConversationType conversationType;
/**
 * model
 */
// @property (strong,nonatomic) RCConversationModel *conversation;

/**
 * 初始化
 */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withConversationModel:(RCConversationModel *)model;

@end
