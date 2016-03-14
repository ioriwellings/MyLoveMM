//
//  AppDelegate.m
//  MM
//  https://github.com/zhengwenming
//  http://www.jianshu.com/p/713dbbaef2f8
//  Created by xiyang on 16/3/9.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 初始化SDK
    [[RCIM sharedRCIM] initWithAppKey:RONGCLOUD_IM_APPKEY];

    
    return YES;
}

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
