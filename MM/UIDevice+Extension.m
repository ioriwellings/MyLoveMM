//
//  UIDevice+Extension.m
//  MM
//
//  Created by xiyang on 16/4/8.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "UIDevice+Extension.h"

@implementation UIDevice (Extension)

+ (DeviceVerType)deviceVerType {
    
    if (MMWidth == 375) {
        return DeviceVer6;
    }else if (MMWidth == 414){
        return DeviceVer6P;
    }else if(MMWidth == 480){
        return DeviceVer4;
    }else if (MMWidth == 568){
        return DeviceVer5;
    }
    return DeviceVer4;
}

@end

