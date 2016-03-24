//
//  MMFriendCell.h
//  MM
//
//  Created by xiyang on 16/3/23.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMFriendCell : UITableViewCell
/**
 * 头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
/**
 * 昵称
 */
@property (weak, nonatomic) IBOutlet UILabel *lblName;
/**
 * 用户模型数据
 */
@property (strong, nonatomic) RCUserInfo *user;

@end
