//
//  MMMineHelper.m
//  MM
//
//  Created by xiyang on 16/4/8.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMMineHelper.h"

@implementation MMMineHelper


#pragma mark - getMineVCItems设置数据
+ (NSMutableArray *)getMineVCItems {
    
    NSMutableArray *items   = [NSMutableArray array];
    MMSettingItem *album    = [MMSettingItem createWithImageName:@"MoreMyAlbum" title:@"相册"];
    MMSettingItem *favorite = [MMSettingItem createWithImageName:@"MoreMyFavorites" title:@"收藏"];
    MMSettingItem *bank     = [MMSettingItem createWithImageName:@"MoreMyBankCard" title:@"钱包"];
    MMSettingItem *card     = [MMSettingItem createWithImageName:@"MyCardPackageIcon" title:@"卡包"];
    MMSettingGroup *groupOne = [[MMSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, card, nil];
    [items addObject:groupOne];
    
    MMSettingItem *expression = [MMSettingItem createWithImageName:@"MoreExpressionShops" title:@"表情"];
    MMSettingGroup *groupTwo = [[MMSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:expression, nil];
    [items addObject:groupTwo];
    
    MMSettingItem *setting = [MMSettingItem createWithImageName:@"MoreSetting" title:@"设置"];
    MMSettingGroup *groupThree = [[MMSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:setting, nil];
    [items addObject:groupThree];
    return items;
}

+ (NSMutableArray *)getMineDetailVCItems:(RCUserInfo *)userInfo {
    
    NSMutableArray *items = [NSMutableArray array];
    MMSettingItem *avatar = [MMSettingItem createWithImageName:nil title:@"头像" subTitle:nil rightImageName:@"publish-gst"];
    MMSettingItem *name = [MMSettingItem createWithTitle:@"昵称" subTitle:userInfo.name];
    MMSettingItem *userID = [MMSettingItem createWithTitle:@"MM号" subTitle:userInfo.userId];
    MMSettingItem *code = [MMSettingItem createWithTitle:@"我的二维码"];
    MMSettingItem *address = [MMSettingItem createWithTitle:@"我的地址"];
    MMSettingGroup *groudOne = [[MMSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:avatar, name, userID, code, address, nil];
    [items addObject:groudOne];
    
    MMSettingItem *sex = [MMSettingItem createWithTitle:@"性别" subTitle:@"男"];
    MMSettingItem *pos = [MMSettingItem createWithTitle:@"地址" subTitle:@"广州市 天河"];
    MMSettingItem *prover = [MMSettingItem createWithTitle:@"个性签名" subTitle:@"work hard, play hard"];
    MMSettingGroup *groupTwo = [[MMSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:sex, pos, prover, nil];
    [items addObject:groupTwo];
    return items;
}

@end











