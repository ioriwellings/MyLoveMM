//
//  MMHttpTools.m
//  MM
//
//  Created by xiyang on 16/3/16.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMHttpTools.h"
#import<CommonCrypto/CommonDigest.h>

@implementation MMHttpTools

+ (MMHttpTools *)shareInstance {
    
    static MMHttpTools *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[[self class] alloc] init];
        instance.allGroups = [NSMutableArray array];
    });
    return instance;
}



- (void)searchFriendListByName:(NSString *)name complete:(void (^)(NSMutableArray *))friendList {
    
    NSMutableArray *list = [NSMutableArray array];
    [MMAFHttpTool searchFriendListByName:name success:^(id response) {
        
        NSString *code = [NSString stringWithFormat:@"%@", response[@"code"]];
        if (friendList) {
            
            if ([code isEqualToString:@"200"]) { // 请求成功
                
                NSArray *dataArray = response[@"result"];
                for (int i = 0; i < dataArray.count; i++) {
                    
                    NSDictionary *dict = [dataArray objectAtIndex:i];
                    RCUserInfo *userInfo = [RCUserInfo new];
                    NSNumber *idNum = [dict objectForKey:@"id"];
                    userInfo.userId = [NSString stringWithFormat:@"%d", idNum.intValue];
                    userInfo.name = [dict objectForKey:@"username"];
                    userInfo.portraitUri = [dict objectForKey:@"portrait"];
                    [list addObject:userInfo];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    friendList(list);
                });
            }
        }
    } failure:^(NSError *error) {
        if (friendList) {
            friendList(list);
        }
    }];
}

- (void)searchFriendListByEmail:(NSString *)email complete:(void (^)(NSMutableArray *))friendList {
    
    
}


#pragma mark - sha1数据校验
- (NSString *) sha1:(NSString *)input {
    
    //const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    //NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

@end
