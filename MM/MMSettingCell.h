//
//  MMSettingCell.h
//  MM
//
//  Created by xiyang on 16/4/8.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMSettingItem.h"

@interface MMSettingCell : UITableViewCell

@property (strong, nonatomic) MMSettingItem *item;

+ (CGFloat)getHeightForText:(MMSettingItem *)item;

@end
