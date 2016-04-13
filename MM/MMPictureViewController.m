//
//  MMPictureViewController.m
//  MM
//
//  Created by xiyang on 16/4/13.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMPictureViewController.h"
#import "MMSwitchPicture.h"

@interface MMPictureViewController ()

@end

@implementation MMPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"相册";
    MMSwitchPicture *switchPicture = [[MMSwitchPicture alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:switchPicture];
    switchPicture.urlArray = @[@"http://box.dwstatic.com/skin/Irelia/Irelia_0.jpg", @"http://box.dwstatic.com/skin/Irelia/Irelia_1.jpg", @"http://box.dwstatic.com/skin/Irelia/Irelia_2.jpg", @"http://box.dwstatic.com/skin/Irelia/Irelia_3.jpg", @"http://box.dwstatic.com/skin/Irelia/Irelia_4.jpg", @"http://box.dwstatic.com/skin/Irelia/Irelia_5.jpg"];
    switchPicture.isLoop = YES;
    [switchPicture setData];
}

@end
