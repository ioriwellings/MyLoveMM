//
//  MMHeaderFooterView.h
//  MM
//
//  Created by xiyang on 16/4/11.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMHeaderFooterView : UITableViewHeaderFooterView

@property (strong, nonatomic) NSString *text;

@property (strong, nonatomic) UILabel *titleLabel;

+ (CGFloat)getHeightForText:(NSString *)text;

@end
