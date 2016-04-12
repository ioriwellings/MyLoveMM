//
//  NSString+Extension.h
//  GSTPatient
//
//  Created by xiyang on 16/2/16.
//  Copyright © 2016年 固生堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/** 转换日期 */
+ (NSString *)getDate:(NSString *)date;

/** 正则表达式判断是否为手机号码 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/** 当前时间转为时间戳 */
+ (NSString *)switchNowTimeToTimeStamp;

/** 计算缓存大小 */
+ (NSString *)getCacheSize;

/** 计算文件大小 */
- (NSInteger)fileSize;

@end
