//
//  MMLoginInfo.m
//  MM
//
//  Created by xiyang on 16/3/21.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMLoginInfo.h"

@implementation MMLoginInfo

+ (id)shareLoginInfo {
    
    static MMLoginInfo *loginInfo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        loginInfo = [[self alloc] init];
    });
    return loginInfo;
}


@end
