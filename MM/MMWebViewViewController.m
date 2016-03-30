//
//  MMWebViewViewController.m
//  MM
//
//  Created by xiyang on 16/3/28.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMWebViewViewController.h"
#import "UIWebView+Extension.h"

@interface MMWebViewViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
/** 后退 */
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;

@end

@implementation MMWebViewViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = self.html.name;
    
    NSURL *url = [NSURL URLWithString:self.html.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    self.webView.allowsInlineMediaPlayback = YES; // 全屏播放
    
    [self.webView loadRequest:request];
    
//    NSURL *url = [NSURL URLWithString:self.html.url];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    self.webView = [UIWebView loadRequest:request loaded:^(UIWebView *webView) {
//        
//        NSLog(@"url = %@", webView.request.URL);
//    } failed:^(UIWebView *webView, NSError *error) {
//        
//        NSLog(@"error = %@", error.localizedDescription);
//    } loadStarted:^(UIWebView *webView) {
//        
//        NSLog(@"start loading to url = %@", webView.request.URL);
//    } shouldLoad:^BOOL(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType) {
//        
//        return YES;
//    }];
}

#pragma mark - 后退
- (IBAction)backClick:(id)sender {
    
    [self.webView goBack];
}

#pragma mark - 前进
- (IBAction)forwardClick:(id)sender {
    
    [self.webView goForward];
}

#pragma mark - 刷新
- (IBAction)refreshClick:(id)sender {
    
    [self.webView reload];
}

#pragma mark - <UIWebViewDelegate>
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.backItem.enabled = webView.canGoBack;
    self.forwardItem.enabled = webView.canGoForward;
    webView.allowsInlineMediaPlayback = YES;
}

@end
