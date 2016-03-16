//
//  FriendsCell.m
//  MM
//
//  Created by xiyang on 16/3/16.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMFriendsCell.h"

@implementation MMFriendsCell

- (void)awakeFromNib {
    
    self.imgIcon.layer.cornerRadius = self.imgIcon.width * 0.2;
    self.imgIcon.layer.masksToBounds = YES;
}

@end
