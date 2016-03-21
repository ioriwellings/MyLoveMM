//
//  AppDelegate.m
//  MM
//  https://github.com/zhengwenming
//  http://www.jianshu.com/p/713dbbaef2f8
//  Created by xiyang on 16/3/9.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "AppDelegate.h"

// <RCIMUserInfoDataSource>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 初始化SDK
    // [[RCIM sharedRCIM] initWithAppKey:MMAPP_IM_APPKEY]; // MMAPPKEY
    [[RCIM sharedRCIM] initWithAppKey:RONGCLOUD_IM_APPKEY]; // 融云APPKEY
    // 数据源代理
    // [[RCIM sharedRCIM] setUserInfoDataSource:self];
    
    return YES;
}

#pragma mark - 用户信息提供者函数(设置聊天用户的基本信息)MMAPP
//- (void)getUserInfoWithUserId:(NSString *)userId
//                   completion:(void (^)(RCUserInfo *userInfo))completion {
//    
//    if ([userId isEqualToString:@"001"]) {
//        
//        RCUserInfo *userInfo = [[RCUserInfo alloc] init];
//        userInfo.userId = userId;
//        userInfo.name = @"唐寅";
//        userInfo.portraitUri = @"http://imgsrc.baidu.com/forum/pic/item/0cb8db4692b7a45934fa4190.jpg";
//        return completion(userInfo);
//    }
//    else if ([userId isEqualToString:@"002"]) {
//        
//        RCUserInfo *userInfo = [[RCUserInfo alloc] init];
//        userInfo.userId = userId;
//        userInfo.name = @"李四";
//        userInfo.portraitUri = @"http://wenwen.soso.com/p/20100713/20100713104743-1862594746.jpg";
//        return completion(userInfo);
//    }
//    else if ([userId isEqualToString:@"003"]) {
//        
//        RCUserInfo *userInfo = [[RCUserInfo alloc] init];
//        userInfo.userId = userId;
//        userInfo.name = @"张三";
//        userInfo.portraitUri = @"http://imgsrc.baidu.com/forum/pic/item/0cb8db4692b7a45934fa4190.jpg";
//        return completion(userInfo);
//
//    }
//    return completion(nil);
//}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}

@end
