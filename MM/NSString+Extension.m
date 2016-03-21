//
//  NSString+Extension.m
//  GSTPatient
//
//  Created by xiyang on 16/2/16.
//  Copyright © 2016年 固生堂. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


#pragma mark - 转换日期
+ (NSString *)getDate:(NSString *)date {
    
    // 转换date的时间戳
    NSDate *dateString = [NSDate dateWithTimeIntervalSince1970:[date floatValue]];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *stringDate = [dateFormatter stringFromDate:dateString];
    return stringDate;
}

#pragma mark - 当前时间转为时间戳
+ (NSString *)switchNowTimeToTimeStamp {
    
    NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", a]; // 转为字符型
    return timeString;
}

#pragma mark - 正则表达式判断是否为手机号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum {
    
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:mobileNum];
}

@end
