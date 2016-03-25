//
//  MMAddressBookTableViewController.h
//  MM
//
//  Created by xiyang on 16/3/24.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMAddressBookTableViewController : UITableViewController

/** 索引 */
@property (strong, nonatomic) NSArray *keys;

/** 所有好友 */
@property (strong, nonatomic) NSMutableDictionary *allFriends;

@property (nonatomic,strong) NSArray *allKeys;

@property (nonatomic,strong) NSArray *seletedUsers;

@property (nonatomic,assign) BOOL hideSectionHeader;

@end
