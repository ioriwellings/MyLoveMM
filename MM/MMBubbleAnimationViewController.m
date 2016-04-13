//
//  MMBubbleAnimationViewController.m
//  MM
//
//  Created by xiyang on 16/4/12.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMBubbleAnimationViewController.h"
#import "MMBubbleButton.h"

#define BubbleButtonHeight 40

#define NavHeight 64

@interface MMBubbleAnimationViewController ()

@property (strong, nonatomic) MMBubbleButton *bubbleButton;

@end

@implementation MMBubbleAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"动画";
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupBubbleButton];
}

- (void)setupBubbleButton {
    
    self.bubbleButton = [[MMBubbleButton alloc] initWithFrame:CGRectMake((MMWidth - BubbleButtonHeight) * 0.5, MMHeight - BubbleButtonHeight - NavHeight, BubbleButtonHeight, BubbleButtonHeight)];
    [self.bubbleButton addTarget:self action:@selector(bubbleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bubbleButton setImage:[UIImage imageNamed:@"Oval"] forState:UIControlStateNormal];
    [self.view addSubview:self.bubbleButton];
    
    self.bubbleButton.maxLeft = MMWidth * 0.5;
    self.bubbleButton.maxRight = MMWidth * 0.5;
    self.bubbleButton.maxHeight = MMHeight;
    self.bubbleButton.duration = 30;
    self.bubbleButton.images = @[[UIImage imageNamed:@"animationRed"], [UIImage imageNamed:@"animationGray"], [UIImage imageNamed:@"animationGreen"], [UIImage imageNamed:@"animationBlue"]];
}

#pragma mark - 显示动画
- (void)bubbleButtonClick:(UIButton *)button {
    
    [self.bubbleButton generateBubbleInRandom];
}

@end
