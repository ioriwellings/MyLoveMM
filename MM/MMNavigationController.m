//
//  MMNavigationController.m
//  MM
//
//  Created by xiyang on 16/3/9.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMNavigationController.h"

@interface MMNavigationController ()

@end

@implementation MMNavigationController


// 第一次使用这个类只调用一次
+ (void)initialize {
    
    // UINavigationBar(全局设置)
    UINavigationBar *bar = [UINavigationBar appearance];
    if([[[UIDevice currentDevice] systemVersion] floatValue] < 7)
    {
        [bar setBackgroundImage:[UIImage imageNamed:@"nav_bg_6"] forBarMetrics:UIBarMetricsDefault];
        
    }
    else
    {
        [bar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    }
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    [bar setTitleTextAttributes:attr];
    // UIBarButtonItem
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // UIControlStateNormal
    NSMutableDictionary *normal = [NSMutableDictionary dictionary];
    normal[NSForegroundColorAttributeName] = [UIColor blackColor];
    normal[NSFontAttributeName] = [UIFont systemFontOfSize:15]; // 取消粗体
    [item setTitleTextAttributes:normal forState:UIControlStateNormal];
    // UIControlStateDisabled
    NSMutableDictionary *disable = [NSMutableDictionary dictionary];
    disable[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:disable forState:UIControlStateDisabled];
    // UIControlStateHighlighted
    NSMutableDictionary *high = [NSMutableDictionary dictionary];
    high[NSForegroundColorAttributeName] = [UIColor greenColor];
    high[NSFontAttributeName] = [UIFont systemFontOfSize:15];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - 设置状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

@end
