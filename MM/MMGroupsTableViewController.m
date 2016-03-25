//
//  MMGroupsTableViewController.m
//  MM
//
//  Created by xiyang on 16/3/24.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMGroupsTableViewController.h"

@interface MMGroupsTableViewController () <UITableViewDelegate, UITableViewDataSource, JoinQuitGroupDelegate>

@property(nonatomic, strong) NSMutableArray* groups;

@end

@implementation MMGroupsTableViewController

#pragma mark - lazy
- (NSMutableArray *)groups {
    
    if (!_groups) {
        
        _groups = [NSMutableArray array];
    }
    return _groups;
}

static NSString *const cellID = @"MMGroupCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"群组";
    self.view.backgroundColor = MMRandomColor;
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MMGroupCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    // 去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    __weak MMGroupsTableViewController *weakSelf = self;
    [MMHTTPTOOLS getAllGroupsWithCompletion:^(NSMutableArray *result) {
        
        self.groups = [NSMutableArray arrayWithArray:result];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakSelf.tableView reloadData];
        });
    }];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.groups.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    MMGroupInfo *group = self.groups[indexPath.row];
    cell.groupInfo = group;
    cell.delegate = self;
    cell.isJoin = group.isJoin;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMGroupInfo *groupInfo = self.groups[indexPath.row];
    MMDidJoinGroupViewController *didJoin = [[MMDidJoinGroupViewController alloc] initWithNibName:NSStringFromClass([MMDidJoinGroupViewController class]) bundle:nil withGroupInfo:groupInfo];
    // 刷新列表数据
    didJoin.updateGroupInfoBlock = ^() {
        
        __weak MMGroupsTableViewController *weakSelf = self;
        [MMHTTPTOOLS getAllGroupsWithCompletion:^(NSMutableArray *result) {
            _groups = result;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
            });
        }];
    };
    [self.navigationController pushViewController:didJoin animated:YES];
}

- (void)joinGroupCallback:(BOOL)result withGroupId:(NSString *)groupId {
    
    if (result) {
        
        [SVProgressHUD showSuccessWithStatus:@"加入成功" maskType:SVProgressHUDMaskTypeBlack];
    }else
    {
        for (MMGroupInfo *group in _groups) {
            
            if ([group.groupId isEqualToString:groupId]) {
                
                if(group.number == group.maxNumber) {
                    
                    [SVProgressHUD showErrorWithStatus:@"加入失败\n人数已满" maskType:SVProgressHUDMaskTypeBlack];
                }
            }
        }
    }
    
    [MMDataSource syncGroups];
    __weak MMGroupsTableViewController *weakSelf = self;
    [MMHTTPTOOLS getAllGroupsWithCompletion:^(NSMutableArray *result) {
        _groups = result;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    }];
}

- (void)launchGroupChatPageByGroupId:(NSString *)groupId {
    
    MMGroupInfo *groupInfo;
    for (MMGroupInfo *group in self.groups) {
        
        if ([group.groupId isEqualToString:groupId]) {
            groupInfo = group;
        }
    }
    if (groupInfo) {
        
        MMChatViewController *temp = [[MMChatViewController alloc]init];
        temp.targetId = groupInfo.groupId;
        temp.conversationType = ConversationType_GROUP;
        temp.userName = groupInfo.groupName;
        temp.title = groupInfo.groupName;
        [self.navigationController pushViewController:temp animated:YES];
    }
}

-(void) quitGroupCallback:(BOOL) result withGroupId:(NSString *)groupId
{
    if (result) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"退出成功！"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
        
        
    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"加入失败！"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
    }
    [MMDataSource syncGroups];
    
}

@end
