//
//  MMGroupInfo.m
//  MM
//
//  Created by xiyang on 16/3/21.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMGroupInfo.h"

@implementation MMGroupInfo
#define KEY_RCDGROUP_INFO_NUMBER @"number"

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        if (decoder == nil) {
            return self;
        }
        //
        self.number = [decoder decodeObjectForKey:KEY_RCDGROUP_INFO_NUMBER];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.number forKey:KEY_RCDGROUP_INFO_NUMBER];
}

@end
