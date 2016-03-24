//
//  MMAgreeFriendCell.h
//  MM
//
//  Created by xiyang on 16/3/23.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMAgreeFriendCell : UITableViewCell

@property (strong, nonatomic) RCMessage *message;

@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDetail;


@end
