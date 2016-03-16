//
//  MMSearchFriendViewController.m
//  MM
//
//  Created by xiyang on 16/3/16.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMSearchFriendViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define topConstant 20

@interface MMSearchFriendViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate, UISearchDisplayDelegate>

/** 搜索所有好友 */
@property (strong, nonatomic) NSMutableArray *friends;
/** UISearchBar顶部约束 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchBarTopConstraint;

@end

@implementation MMSearchFriendViewController

static NSString *const registerCellID = @"friends";
#pragma mark - lazy
- (NSMutableArray *)friends {
    
    if (!_friends) {
        
        _friends = [NSMutableArray array];
    }
    return _friends;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"查找好友";
}

#pragma mark - <UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return self.friends.count;
    }
    return 0;
}
// cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return 80.f;
    }
    return 0.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:registerCellID];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        if (!cell) {
            
            cell = [[MMFriendsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:registerCellID];
        }
        RCUserInfo *user = self.friends[indexPath.row];
        if (user) {
            
            cell.lblName.text = user.name;
            [cell.imgIcon sd_setImageWithURL:[NSURL URLWithString:user.portraitUri] placeholderImage:[UIImage imageNamed:@"icon_person"]];
        }
    }
    return cell;
}

#pragma mark - <UISearchBarDelegate>
/**
 *  执行delegate搜索好友
 */
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    [self.friends removeAllObjects];
    if (searchText.length) {
        
        [MMHTTPTOOLS searchFriendListByName:searchText complete:^(NSMutableArray *result) {
            
            NSLog(@"%@", result);
            if (result) {
                
                [self.friends addObjectsFromArray:result];
                dispatch_async(dispatch_get_main_queue(), ^{
                   
                    [self.searchDisplayController.searchResultsTableView reloadData];
                });
            }
        }];
    }
    else {
        
        NSLog(@"ddd");
    }
}

#pragma mark - <UISearchDisplayDelegate>
- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    
    self.searchBarTopConstraint.constant = topConstant;
    [self.view layoutIfNeeded]; // 刷新约束
}

- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
    
    self.searchBarTopConstraint.constant = 0;
    [self.view layoutIfNeeded]; // 刷新约束
}


@end
