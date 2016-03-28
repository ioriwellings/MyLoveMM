//
//  MMHTML.m
//  MM
//
//  Created by xiyang on 16/3/28.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMHTML.h"

@implementation MMHTML

+ (instancetype)mmHTMLWithDictionary:(NSDictionary *)dict {
    
    MMHTML *html = [[MMHTML alloc] init];
    
    html.name = dict[@"name"];
    html.icon = dict[@"icon"];
    html.url = dict[@"url"];
    return html;
}

@end
