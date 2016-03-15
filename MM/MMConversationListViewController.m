//
//  MMConversationListViewController.m
//  MM
//
//  Created by xiyang on 16/3/15.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMConversationListViewController.h"

@interface MMConversationListViewController ()

/** 强引用右上角按钮 */
@property (strong, nonatomic) UIButton *rightBarButton;
@end

@implementation MMConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"会话";
    self.view.backgroundColor = MMRandomColor;
    [self setupRightBarButtonItem];
}

#pragma mark - 自定义rightBarButtonItem
- (void)setupRightBarButtonItem {
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.rightBarButton = rightButton;
    [rightButton setImage:[UIImage imageNamed:@"barbuttonicon_add"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [rightBarBtn setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
}

- (void)rightButtonClick:(UIButton *)sender {
    
    NSArray *menuItems = @[
                           
                           [KxMenuItem menuItem:@"发起聊天" image:[UIImage imageNamed:@"chat_icon"] target:self action:@selector(pushChat:)],
                           [KxMenuItem menuItem:@"添加朋友" image:[UIImage imageNamed:@"addfriend_icon"] target:self action:@selector(pushAddFriend:)],
                           [KxMenuItem menuItem:@"通讯录" image:[UIImage imageNamed:@"contact_icon"] target:self action:@selector(pushAddressBook:)],
                           [KxMenuItem menuItem:@"公众账号" image:[UIImage imageNamed:@"public_account"] target:self action:@selector(pushPublicService:)],
                           [KxMenuItem menuItem:@"添加公众号" image:[UIImage imageNamed:@"add_public_account"] target:self action:@selector(pushAddPublicService:)],
                           ];
    CGRect targetFrame = self.tabBarController.navigationItem.rightBarButtonItem.customView.frame;
    targetFrame.origin.x = MMWidth - 40;
    targetFrame.origin.y = targetFrame.origin.y + 48;
    [KxMenu showMenuInView:self.navigationController.view fromRect:targetFrame menuItems:menuItems];
}

- (void)pushChat:(UIButton *)sender {
    
    [self dismissPop:@"发起聊天暂时没实现"];
}

- (void)pushAddFriend:(UIButton *)sender {
    
    MMAddFriendsViewController *addFriends = [[MMAddFriendsViewController alloc] init];
    [self.navigationController pushViewController:addFriends animated:NO];
}

- (void)pushAddressBook:(UIButton *)sender {
    
    [self dismissPop:@"通讯录暂时没实现"];
}

- (void)pushPublicService:(UIButton *)sender {
    
    [self dismissPop:@"公众账号暂时没实现"];
}

- (void)pushAddPublicService:(UIButton *)sender {
    
    [self dismissPop:@"添加公众号暂时没实现"];
}

- (void)dismissPop:(NSString *)message {
    
    [SVProgressHUD showInfoWithStatus:message maskType:SVProgressHUDMaskTypeBlack];
    [UIView animateWithDuration:2.5 animations:^{
        [SVProgressHUD dismiss];
    }];
}

@end
