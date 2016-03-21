//
//  MMTextFieldValidate.h
//  MM
//
//  Created by xiyang on 16/3/21.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMTextFieldValidate : NSObject

/** 验证手机号码 */
+ (BOOL)validateMobile:(NSString *)mobile;

/** 验证电子邮箱 */
+ (BOOL)validateEmail:(NSString *)email;

/** 验证密码 */
+ (BOOL)validatePassword:(NSString *)password;

@end
