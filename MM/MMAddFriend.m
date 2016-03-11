//
//  MMAddFriend.m
//  MM
//
//  Created by xiyang on 16/3/11.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMAddFriend.h"

@implementation MMAddFriend

+ (instancetype)mmAddriendWithDictionary:(NSDictionary *)dict {
    
    MMAddFriend *addFriend = [[MMAddFriend alloc] init];
    addFriend.icon = dict[@"icon"];
    addFriend.title = dict[@"title"];
    addFriend.subTitle = dict[@"subTitle"];
    return addFriend;
}

@end
