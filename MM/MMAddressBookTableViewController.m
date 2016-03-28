//
//  MMAddressBookTableViewController.m
//  MM
//
//  Created by xiyang on 16/3/24.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMAddressBookTableViewController.h"

// #import <ctype.h>

@interface MMAddressBookTableViewController ()

//#字符索引对应的user object
@property (nonatomic,strong) NSMutableArray *tempOtherArr;
@property (strong, nonatomic) NSMutableArray *friends;

@end

@implementation MMAddressBookTableViewController

static NSString *const registerID = @"MMFriendBookCell";

#pragma mark - lazy
- (NSMutableArray *)friends {
    
    if (!_friends) {
        
        _friends = [NSMutableArray array];
    }
    return _friends;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"通讯录";
    self.view.backgroundColor = MMRandomColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MMFriendBookCell class]) bundle:nil] forCellReuseIdentifier:registerID];
    // 去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    // 获取用户所有好友
    [self getAllFriendsData];
}

- (void)getAllFriendsData {
    
    _keys = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"];
    
    _allFriends = [NSMutableDictionary dictionary];
    _allKeys = [NSMutableArray array];
    self.friends = [NSMutableArray arrayWithArray:[[MMDataBaseManager shareInstance] getAllFriends]];
    __weak MMAddressBookTableViewController *weakSelf = self;
    if (self.friends == nil || self.friends.count < 1) {
        
        [MMDataSource syncFriendList:^(NSMutableArray *friends) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                // 刷新列表数据
                [weakSelf.tableView reloadData];
            });
        }];
    }
    else {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // 刷新列表数据
            [weakSelf.tableView reloadData];
        });
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.friends.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMFriendBookCell *cell = [tableView dequeueReusableCellWithIdentifier:registerID];
    cell.userInfo = self.friends[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMUserInfo *userInfo = self.friends[indexPath.row];
    MMChatViewController *chat = [[MMChatViewController alloc] init];
    chat.targetId = userInfo.userId;
    chat.conversationType = ConversationType_PRIVATE;
    chat.userName = userInfo.name;
    chat.title = userInfo.name;
    [self.navigationController pushViewController:chat animated:YES];
}

@end
