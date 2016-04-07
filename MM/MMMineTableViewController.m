//
//  MMMineTableViewController.m
//  MM
//
//  Created by xiyang on 16/4/7.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMMineTableViewController.h"
#import "MMSettingItem.h"
#import "MMSettingGroup.h"

@interface MMMineTableViewController ()

@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation MMMineTableViewController

#pragma mark - lazy
- (NSMutableArray *)data {
    
    if (!_data) {
        
        _data = [NSMutableArray array];
    }
    return _data;
}

static NSString *const identifyID = @"MMUserDetailCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我";
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0); // 设置tableView的内边距，向上移20
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    self.tableView.sectionHeaderHeight = 5;

    // 注册
    [self.tableView registerClass:[MMUserDetailCell class] forCellReuseIdentifier:identifyID];
    // 加载数据
    [self reloadDetailData];
}

- (void)reloadDetailData {
    
    self.data = [self getMineVCItems];
    self.userInfo = [[RCIM sharedRCIM] currentUserInfo];
    [self.tableView reloadData];
}

- (NSMutableArray *)getMineVCItems {
    
    NSMutableArray *items   = [NSMutableArray array];
    MMSettingItem *album    = [MMSettingItem createWithImageName:@"MoreMyAlbum" title:@"相册"];
    MMSettingItem *favorite = [MMSettingItem createWithImageName:@"MoreMyFavorites" title:@"收藏"];
    MMSettingItem *bank     = [MMSettingItem createWithImageName:@"MoreMyBankCard" title:@"钱包"];
    MMSettingItem *card     = [MMSettingItem createWithImageName:@"MyCardPackageIcon" title:@"卡包"];
    MMSettingGroup *groupOne = [[MMSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, card, nil];
    [items addObject:groupOne];
    
    MMSettingItem *expression = [MMSettingItem createWithImageName:@"MoreExpressionShops" title:@"表情"];
    MMSettingGroup *groupTwo = [[MMSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:expression, nil];
    [items addObject:groupTwo];
    
    MMSettingItem *setting = [MMSettingItem createWithImageName:@"MoreSetting" title:@"设置"];
    MMSettingGroup *groupThree = [[MMSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:setting, nil];
    [items addObject:groupThree];
    return items;
}

#pragma mark - UITableViewDataSource
// 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.data ? self.data.count + 1 : 0;
}

// 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        
        return 1;
    }
    else {
        
        MMSettingGroup *group = [self.data objectAtIndex:section - 1]; // 这里section从1开始
        return group.itemsCount;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        MMUserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifyID forIndexPath:indexPath];
        cell.userInfo = self.userInfo;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 右边小箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:[UIColor whiteColor]];
        return cell;
    }
    else {
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 右边小箭头
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}


#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1]];
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return [super tableView:tableView heightForFooterInSection:0];
    }
    return [super tableView:tableView heightForFooterInSection:section - 1];
}

@end
