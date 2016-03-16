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

#pragma mark - 设置显示的会话类型
// 如果不写在初始化里面会导致第一次进入会话列表时是空的
- (instancetype)init {
    
    self = [super init];
    if (self) {
        //设置要显示的会话类型
        [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE), @(ConversationType_GROUP), @(ConversationType_DISCUSSION), @(ConversationType_APPSERVICE), @(ConversationType_SYSTEM), @(ConversationType_PUBLICSERVICE)]];
        // 聚合会话类型
        [self setCollectionConversationType:@[@(ConversationType_GROUP), @(ConversationType_DISCUSSION)]];
    }
    return self;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"会话";
    self.view.backgroundColor = MMRandomColor;
}

#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    _isClick = YES;
    [self setupRightBarButtonItem];
    // 设置未读消息
    [self notifyUpdateUnreadMessageCount];
    // 刷新讨论组消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNeedRefreshNotification:) name:@"kRCNeedReloadDiscussionListNotification" object:nil];
}

#pragma mark - 点击cell进入聊天页面
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
    
    if (_isClick) {
        
        _isClick = NO;
        if (model.conversationType == RC_CONVERSATION_MODEL_TYPE_PUBLIC_SERVICE) {
            
            MMChatViewController *chatVC = [[MMChatViewController alloc] init];
            chatVC.conversationType = model.conversationType;
            chatVC.targetId = model.targetId;
            chatVC.userName = model.conversationTitle;
            chatVC.title = model.conversationTitle;
            chatVC.conversation = model;
            chatVC.unReadMessage = model.unreadMessageCount;
            [self.navigationController pushViewController:chatVC animated:YES];
        }
        
        if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_NORMAL) {
            
            MMChatViewController *chatVC = [[MMChatViewController alloc] init];
            chatVC.conversationType = model.conversationType;
            chatVC.targetId = model.targetId;
            chatVC.userName = model.conversationTitle;
            chatVC.title = model.conversationTitle;
            chatVC.conversation = model;
            chatVC.unReadMessage = model.unreadMessageCount;
            chatVC.enableNewComingMessageIcon = YES; // 开启消息提醒
            chatVC.enableUnreadMessageIcon = YES;
            if (model.conversationModelType == ConversationType_SYSTEM) {
                
                chatVC.userName = @"系统消息";
                chatVC.title = @"系统消息";
            }
            [self.navigationController pushViewController:chatVC animated:YES];
        }
        
        // 聚合会话类型
        if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_COLLECTION) {
            
            MMConversationListViewController *chatList = [[MMConversationListViewController alloc] init];
            NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithInt:model.conversationType]];
            [chatList setDisplayConversationTypes:array];
            [chatList setCollectionConversationType:nil];
            chatList.isEnteredToCollectionViewController = YES;
            [self.navigationController pushViewController:chatList animated:YES];
        }
    }
}

#pragma mark - 即将显示cell的回调(修改cell的数据)
- (void)willDisplayConversationTableCell:(RCConversationBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    RCConversationModel *model = self.conversationListDataSource[indexPath.row]; // 数据源数据
    if (model.conversationType == ConversationType_PRIVATE) {
        
        RCConversationCell *conversationCell = (RCConversationCell *)cell;
        conversationCell.conversationTitle.textColor = MMboldColor;
        conversationCell.conversationTitle.font = [UIFont systemFontOfSize:15];
    }
}

#pragma mark - 设置不断刷新讨论组消息
- (void)receiveNeedRefreshNotification:(NSNotification *)status {
    
    __weak typeof(&*self) __blockSelf = self;
    if (__blockSelf.displayConversationTypeArray.count == 1 && [__blockSelf.displayConversationTypeArray[0] integerValue] == ConversationType_DISCUSSION) {
        
        [__blockSelf refreshConversationTableViewIfNeeded];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 设置在NavigatorBar中显示连接中的提示
    self.showConnectingStatusOnNavigatorBar = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kRCNeedReloadDiscussionListNotification" object:nil];
}
//由于demo使用了tabbarcontroller，当切换到其它tab时，不能更改tabbarcontroller的标题。
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.showConnectingStatusOnNavigatorBar = NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kRCNeedReloadDiscussionListNotification" object:nil];
}

#pragma mark - 设置未读消息
- (void)notifyUpdateUnreadMessageCount {
    
    [self updateBadgeValueForTabBarItem];
}

- (void)updateBadgeValueForTabBarItem {
    
    __weak typeof(self) __weakSelf = self;
    // 异步读取
    dispatch_async(dispatch_get_main_queue(), ^{
        
        int count = [[RCIMClient sharedRCIMClient] getUnreadCount:self.displayConversationTypeArray];
        if (count > 0) {
            
            __weakSelf.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", count];
        }
        else {
            
            __weakSelf.tabBarItem.badgeValue = nil;
        }
    });
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
                           
                           [KxMenuItem menuItem:@"发起聊天"
                                          image:[UIImage imageNamed:@"chat_icon"]
                                         target:self
                                         action:@selector(pushChat:)],
                           [KxMenuItem menuItem:@"添加朋友"
                                          image:[UIImage imageNamed:@"addfriend_icon"]
                                         target:self
                                         action:@selector(pushAddFriend:)],
                           [KxMenuItem menuItem:@"通讯录"
                                          image:[UIImage imageNamed:@"contact_icon"]
                                         target:self
                                         action:@selector(pushAddressBook:)],
                           [KxMenuItem menuItem:@"公众账号"
                                          image:[UIImage imageNamed:@"public_account"]
                                         target:self
                                         action:@selector(pushPublicService:)],
                           [KxMenuItem menuItem:@"添加公众号"
                                          image:[UIImage imageNamed:@"add_public_account"]
                                         target:self
                                         action:@selector(pushAddPublicService:)],
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
    
    MMSearchFriendViewController *search = [[MMSearchFriendViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];
}

- (void)pushAddressBook:(UIButton *)sender {
    
    [self dismissPop:@"通讯录暂时没实现"];
}

- (void)pushPublicService:(UIButton *)sender {
    
    [self dismissPop:@"公众账号暂时没实现"];
}

- (void)pushAddPublicService:(UIButton *)sender {
    
    MMAddPublicViewController *addFriends = [[MMAddPublicViewController alloc] init];
    [self.navigationController pushViewController:addFriends animated:NO];
}

- (void)dismissPop:(NSString *)message {
    
    [SVProgressHUD showInfoWithStatus:message maskType:SVProgressHUDMaskTypeBlack];
    [UIView animateWithDuration:2.5 animations:^{
        [SVProgressHUD dismiss];
    }];
}


@end
