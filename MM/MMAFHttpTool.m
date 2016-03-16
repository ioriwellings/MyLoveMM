//
//  MMAFHttpTool.m
//  MM
//
//  Created by xiyang on 16/3/16.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMAFHttpTool.h"

#define FAKE_SERVER @"http://webim.demo.rong.io/"//@"http://119.254.110.241:80/" //Login 线下测试
#define ContentType @"text/html"

@implementation MMAFHttpTool

+ (void)requestWihtMethod:(RequestMethodType)methodType url:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    NSURL *baseURL = [NSURL URLWithString:FAKE_SERVER];
    // 获得请求管理者
    AFHTTPRequestOperationManager *manage = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
#ifdef ContentType
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObject:ContentType];
#endif
    manage.requestSerializer.HTTPShouldHandleCookies = YES;
    NSString *cookieString = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserCookies"];
    if (cookieString) {
        [manage.requestSerializer setValue:cookieString forHTTPHeaderField:@"Cookie"];
    }
    
    switch (methodType) {
        case RequestMethodTypeGet:
        {
            // GET请求
            [manage GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                
                if (success) {
                    NSLog(@"responseObject = %@", responseObject);
                    success(responseObject);
                }
            } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case RequestMethodTypePost:
        {
            // POST请求
            [manage POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                
                if (success) {
                    
                    NSString *cookieString = [[operation.response allHeaderFields] valueForKey:@"Set-Cookie"];
                    [[NSUserDefaults standardUserDefaults] setObject:cookieString forKey:@"UserCookies"];
                    success(responseObject);
                }
            } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - 根据昵称搜索好友
+ (void)searchFriendListByName:(NSString *)name success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    [MMAFHttpTool requestWihtMethod:RequestMethodTypeGet
                                url:@"seach_name"
                             params:@{@"username" : name}
                            success:success
                            failure:failure];
}
@end
