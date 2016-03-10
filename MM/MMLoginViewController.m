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

#pragma mark - 切换注册和登录界面
- (IBAction)registerAccountClict:(UIButton *)sender {
    
    self.leftSpace.constant = - MMWidth;
    self.rightSpace.constant = MMWidth - MMConstantMargin;
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.view layoutIfNeeded]; // 刷新约束
    }];
    // 修改导航栏名
    self.title = @"注册MM";
}

- (IBAction)loginAccountClick:(UIButton *)sender {
    
    self.leftSpace.constant = - MMConstantMargin;
    self.rightSpace.constant = - MMConstantMargin;
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.view layoutIfNeeded]; // 刷新约束
    }];
    self.title = @"登录MM";
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
