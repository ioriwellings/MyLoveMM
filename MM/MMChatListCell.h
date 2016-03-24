//
//  MMChatListCell.h
//  MM
//
//  Created by xiyang on 16/3/23.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface MMChatListCell : RCConversationBaseCell

//@property (weak, nonatomic) IBOutlet UIImageView *ivAva;
//@property (weak, nonatomic) IBOutlet UILabel *lblName;
//@property (weak, nonatomic) IBOutlet UILabel *lblDetail;
//@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@property (nonatomic,strong) UIImageView *ivAva;
@property (nonatomic,strong) UILabel *lblName;
@property (nonatomic,strong) UILabel *lblDetail;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, strong) UILabel *labelTime;

@end
