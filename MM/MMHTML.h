//
//  MMHTML.h
//  MM
//
//  Created by xiyang on 16/3/28.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMHTML : NSObject

/**
 *  名称
 */
@property (copy, nonatomic) NSString *name;

/**
 *  图标url
 */
@property (copy, nonatomic) NSString *icon;

/**
 *  连接url
 */
@property (copy, nonatomic) NSString *url;

+ (instancetype)mmHTMLWithDictionary:(NSDictionary *)dict;

@end
