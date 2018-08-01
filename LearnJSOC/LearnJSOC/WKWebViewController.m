//
// Created by 林恺祺 on 2018/8/1.
// Copyright (c) 2018 minstone. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>
#import <AVFoundation/AVFoundation.h>

@interface WKWebViewController () <WKNavigationDelegate, WKUIDelegate>

@property(nonatomic, strong) WKWebView *webView;
@property(nonatomic, strong) UIProgressView *progressView;

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    self.title = @"WKWebView拦截URL";

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                 target:self
                                 action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self initWKWebView];

}

- (void)initWKWebView {
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration
            alloc] init];
    configuration.userContentController = [WKUserContentController new];
    WKPreferences *preferences = [WKPreferences new];

    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    preferences.minimumFontSize = 30.0;
    configuration.preferences = preferences;
    self.webView = [[WKWebView alloc]
            initWithFrame:self.view.frame configuration:configuration];

    NSString *urlString = [[NSBundle mainBundle]
            pathForResource:@"index.html" ofType:nil];
    NSURL *fileURL = [NSURL fileURLWithPath:urlString];
    [self.webView loadFileURL:fileURL allowingReadAccessToURL:fileURL];

    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    [self.view addSubview:self.webView];
}

- (void)rightClick {
    [self.webView goBack];
}

#pragma mark - WKNavigationDelegate

//- (void)                webView:(WKWebView *)webView
//decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
//                decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    NSURL *url = navigationAction.request.URL;
//    NSString *scheme = [url scheme];
//    if ([scheme isEqualToString:@""])
//}

#pragma mark - WKUIdelegate

- (void)                   webView:(WKWebView *)webView
runJavaScriptAlertPanelWithMessage:(NSString *)message
                  initiatedByFrame:(WKFrameInfo *)frame
                 completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"I Know"
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction *action) {
                                                completionHandler();
                                            }]];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}

@end