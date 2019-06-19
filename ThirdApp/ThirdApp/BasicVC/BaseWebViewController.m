//
//  BaseWebViewController.m
//  OneApp
//
//  Created by leiyong on 2019/5/8.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "BaseWebViewController.h"
#import <WebKit/WKWebView.h>

@interface BaseWebViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, copy) NSString *URLString;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation BaseWebViewController

- (instancetype)initWithURLString:(NSString *)URLString title:(nonnull NSString *)title{
    self = [super init];
    if (self) {
        self.URLString = URLString;
        self.navigationItem.title = title;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.progressView.frame = CGRectMake(0, 0 , LYSCREENWIDTH, 2);

}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.isHidNavigationBar) {
        self.webView.y = self.webView.y - 45;
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    self.webView.navigationDelegate = self;
    self.webView.backgroundColor = [UIColor whiteColor];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.URLString]];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:request];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, LYSCREENWIDTH, 2)];
    self.progressView.tintColor = [UIColor colorWithHexString:@"F9A128"];
    self.progressView.trackTintColor = [UIColor whiteColor];

    [self.view addSubview:self.progressView];
    
    self.tabBarController.tabBar.hidden = YES;

}

- (void)setIsHidNavigationBar:(BOOL)isHidNavigationBar {
    _isHidNavigationBar = isHidNavigationBar;
    if (isHidNavigationBar) {
        self.webView.y =self.webView.y -  45;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqual:@"estimatedProgress"] && object == self.webView) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
        if (self.webView.estimatedProgress  >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:YES];
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
@end
