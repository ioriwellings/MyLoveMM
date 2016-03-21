//
//  MMLoginInfo.h
//  MM
//
//  Created by xiyang on 16/3/21.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMLoginInfo : NSObject

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *result;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *portrait;
@property (nonatomic, copy) NSString *token;

/** 单例 */
+ (id)shareLoginInfo;
@end
