//
//  FriendsCell.h
//  MM
//
//  Created by xiyang on 16/3/16.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMFriendsCell : UITableViewCell

/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@end
