//
//  MMLoginViewController.m
//  MM
//
//  Created by xiyang on 16/3/10.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMLoginViewController.h"

@interface MMLoginViewController ()
/** 登录账号 */
@property (weak, nonatomic) IBOutlet MMLoginRegisterTextField *txtLoginAccount;
/** 登录密码 */
@property (weak, nonatomic) IBOutlet MMLoginRegisterTextField *txtLoginPassword;
/** 注册账号 */
@property (weak, nonatomic) IBOutlet MMLoginRegisterTextField *txtRegisterAccount;
/** 注册密码 */
@property (weak, nonatomic) IBOutlet MMLoginRegisterTextField *txtRegisterPassword;
/** 下划线 */
@property (weak, nonatomic) IBOutlet UIView *loginLineOne;
@property (weak, nonatomic) IBOutlet UIView *loginLineTwo;
@property (weak, nonatomic) IBOutlet UIView *registerLineOne;
@property (weak, nonatomic) IBOutlet UIView *registerLineTwo;





@end

@implementation MMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = MMboldColor;
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [self.navigationController.navigationBar setTitleTextAttributes:attr];
    
}


- (IBAction)loginClick:(id)sender {
    
    MMTabBarController *tab = [[MMTabBarController alloc] init];
    self.view.window.rootViewController = tab;
}

#pragma mark - 点击屏幕退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

@end
