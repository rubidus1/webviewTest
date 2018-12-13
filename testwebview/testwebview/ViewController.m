//
//  ViewController.m
//  testwebview
//
//  Created by User on 13/12/2018.
//  Copyright © 2018 User. All rights reserved.
//

#import "ViewController.h"

@import WebKit;

@interface ViewController () <UIScrollViewDelegate, WKUIDelegate, WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBarView];
    [self setupWebView];
}

- (void)setupWebView {
    self.webView.scrollView.delegate = self;
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    NSURL *url = [NSURL URLWithString:@"https://www.apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)setupNavigationBarView {
    self.title = @"Why nav. bar collapse?";
    self.navigationController.navigationBarHidden = NO;
    if (@available(iOS 11, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
    }
    self.navigationController.navigationBar.translucent = NO;
}


@end
