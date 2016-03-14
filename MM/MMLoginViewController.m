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
/** 右边约束 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightSpace;
/** 左边约束 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSpace;



@end

@implementation MMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor blackColor];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [self.navigationController.navigationBar setTitleTextAttributes:attr];
    
    [self.txtLoginAccount addTarget:self action:@selector(accountTextFieldDidBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self.txtLoginAccount addTarget:self action:@selector(accountTextfieldDidEndEditing) forControlEvents:UIControlEventEditingDidEnd];
    [self.txtLoginPassword addTarget:self action:@selector(passwordTextFieldDidBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self.txtLoginPassword addTarget:self action:@selector(passwordTextFieldDidEndEditing) forControlEvents:UIControlEventEditingDidEnd];
    [self.txtRegisterAccount addTarget:self action:@selector(accountTextFieldDidBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self.txtRegisterAccount addTarget:self action:@selector(accountTextfieldDidEndEditing) forControlEvents:UIControlEventEditingDidEnd];
    [self.txtRegisterPassword addTarget:self action:@selector(passwordTextFieldDidBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self.txtRegisterPassword addTarget:self action:@selector(passwordTextFieldDidEndEditing) forControlEvents:UIControlEventEditingDidEnd];
}

#pragma mark - 改变TextField下划线颜色方法
- (void)accountTextFieldDidBeginEditing {
    
    self.loginLineOne.backgroundColor = MMTintColor;
    self.registerLineOne.backgroundColor = MMTintColor;
}

- (void)accountTextfieldDidEndEditing {
    
    self.loginLineOne.backgroundColor = MMboldColor;
    self.registerLineOne.backgroundColor = MMboldColor;
}

- (void)passwordTextFieldDidBeginEditing {
    
    self.loginLineTwo.backgroundColor = MMTintColor;
    self.registerLineTwo.backgroundColor = MMTintColor;
}

- (void)passwordTextFieldDidEndEditing {
    
    self.loginLineTwo.backgroundColor = MMboldColor;
    self.registerLineTwo.backgroundColor = MMboldColor;
}

#pragma mark - 切换注册界面
- (IBAction)registerAccountClict:(UIButton *)sender {
    
    self.leftSpace.constant = - MMWidth;
    self.rightSpace.constant = MMWidth - MMConstantMargin;
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.view layoutIfNeeded]; // 刷新约束
    }];
    // 修改导航栏名
    self.title = @"注册MM";
}

#pragma mark - 切换登录界面
- (IBAction)loginAccountClick:(UIButton *)sender {
    
    self.leftSpace.constant = - MMConstantMargin;
    self.rightSpace.constant = - MMConstantMargin;
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.view layoutIfNeeded]; // 刷新约束
    }];
    self.title = @"登录MM";
}

#pragma mark - 找回密码
- (IBAction)findBackYourPassword:(id)sender {
    
    [SVProgressHUD showInfoWithStatus:@"暂时没实现" maskType:SVProgressHUDMaskTypeBlack];
    [UIView animateWithDuration:2.5 animations:^{
        
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - 获取默认用户
/*
 * 获取默认用户名、密码、TokenID
 */
- (BOOL)getDefaultUser {
    
    NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"]; // 获取沙盒中用户名
    NSString *userPassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"userPassword"]; // 获取沙盒中密码
    NSString *tokenID = [[NSUserDefaults standardUserDefaults] objectForKey:@"tokenID"];
    return userName && userPassword && tokenID;
}

- (BOOL)getDefaultTokenID {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"tokenID"];
}

- (NSString *)getDefaultUserName {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
}

- (NSString *)getDefaultUserPassword {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"userPassword"];
}

- (NSString *)getDefaultUserTokenID {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"tokenID"];
}

#pragma mark - 登录
- (IBAction)loginClick:(id)sender {
    
    // 检查当前网络状态
    RCNetworkStatus status = [[RCIMClient sharedRCIMClient] getCurrentNetworkStatus];
    if (status == RC_NotReachable) {
        
        [SVProgressHUD showErrorWithStatus:@"当前网络不可用" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    else { // 用户登录
        
        NSString *userName = self.txtLoginAccount.text;
        NSString *userPassword = self.txtLoginPassword.text;
        
        // 获取沙盒中是否有保存用户信息
        if ([self getDefaultTokenID]) { // 有
            
            NSLog(@"tokenID保存在沙盒");
            NSString *tokenID = [self getDefaultUserTokenID];
            [self loginWithUserName:userName withUserPassword:userPassword withTokenID:tokenID];
        }
        else { // 否
            
            NSLog(@"tokenID没有保存在沙盒");
            // 这里通过后台接口获取用户的TokenID(暂时用融云)
            NSString *tokenID = @"BPsq/lFeia60FVwN/BIV5qxiKdwUDwEVb3cAtaMvw1+rLZUyShKwpiY9AaqvOqDCclntoEQNOKiaIpb9glAb8g==";
            [[NSUserDefaults standardUserDefaults] setObject:tokenID forKey:@"tokenID"]; // 缓存在沙盒
            [self loginWithUserName:userName withUserPassword:userPassword withTokenID:tokenID];
        }
    }
}

- (void)loginWithUserName:(NSString *)userName withUserPassword:(NSString *)userPassword withTokenID:(NSString *)tokenID {
    
    [[RCIM sharedRCIM] connectWithToken:tokenID success:^(NSString *userId) {
        
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
        [self login];
    } error:^(RCConnectErrorCode status) {
        
        NSLog(@"status = %zd", status);
    } tokenIncorrect:^{
        
        NSLog(@"TokenID已过期，请重新获取");
    }];
}

- (void)login {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        MMTabBarController *tab = [[MMTabBarController alloc] init];
        self.view.window.rootViewController = tab;
    });
}

#pragma mark - 点击屏幕退出键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

@end
