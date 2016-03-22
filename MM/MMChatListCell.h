//
//  MMChatListCellTableViewCell.h
//  MM
//
//  Created by xiyang on 16/3/22.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMChatListCell : RCConversationBaseCell

@property (weak, nonatomic) IBOutlet UIImageView *ivAva;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDetail;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@property (nonatomic, copy) NSString *userName;

@end
