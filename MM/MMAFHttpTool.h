//
//  MMAFHttpTool.h
//  MM
//
//  Created by xiyang on 16/3/16.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RequestMethodType){
    RequestMethodTypePost = 1,
    RequestMethodTypeGet = 2
};

@interface MMAFHttpTool : NSObject

/**
 *  发送一个请求
 *
 *  @param methodType   请求方法
 *  @param url          请求路径
 *  @param params       请求参数
 *  @param success      请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure      请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+(void) requestWihtMethod:(RequestMethodType)methodType
                     url : (NSString *)url
                   params:(NSDictionary *)params
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError *err))failure;

/** 按昵称搜索好友 */
+ (void)searchFriendListByName:(NSString *)name success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;

@end
