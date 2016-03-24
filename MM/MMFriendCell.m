//
//  MMFriendCell.m
//  MM
//
//  Created by xiyang on 16/3/23.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMFriendCell.h"

@implementation MMFriendCell

- (void)awakeFromNib {
    
    self.imgIcon.layer.cornerRadius = self.imgIcon.width * 0.2;
    self.imgIcon.layer.masksToBounds = YES;
    // 去掉点击cell时的背景颜色
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setUser:(RCUserInfo *)user {
    
    _user = user;
    
    if (user) {
        
        self.lblName.text = user.name;
        [self.imgIcon sd_setImageWithURL:[NSURL URLWithString:user.portraitUri] placeholderImage:[UIImage imageNamed:@"icon_person"]];
    }
}

@end
