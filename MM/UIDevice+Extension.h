//
//  UIDevice+Extension.h
//  MM
//
//  Created by xiyang on 16/4/8.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DeviceVerType) {
    
    DeviceVer4,
    DeviceVer5,
    DeviceVer6,
    DeviceVer6P
};

@interface UIDevice (Extension)

+ (DeviceVerType)deviceVerType;

@end
