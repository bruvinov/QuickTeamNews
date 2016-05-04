//
//  WebViewController.m
//  SportsTeams
//
//  Created by Boris Ruvinov on 3/14/16.
//  Copyright © 2016 Boris Ruvinov. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)createWebView {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, screenWidth, screenHeight)];
    
    [self loadWebsite];
    
    [self.view addSubview:self.webView];
}

//- (void)orientationChangedToLandscape {
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    CGFloat screenWidth = screenRect.size.width;
//    CGFloat screenHeight = screenRect.size.height;
//    self.webView.frame.size.width = screenWidth;
//    self.webView.frame.size.height = screenHeight;
//}

- (void)loadWebsite {
    NSMutableString *http = [NSMutableString stringWithString: @"http://"];
    [http appendString:self.url];
    NSURL *teamURL = [NSURL URLWithString:http];
    NSURLRequest *request=[NSURLRequest requestWithURL:teamURL];
    [self.webView loadRequest:request];
}

- (void)createButton {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    self.backButton = [[UIButton alloc]initWithFrame:CGRectMake(screenWidth - 90, screenHeight - 90, 69, 40)];
    [self.backButton setBackgroundColor:[UIColor redColor]];
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.backButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:15]];
    [self.backButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self.backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.backButton];
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
        [self.webView removeFromSuperview];
        [self.backButton removeFromSuperview];
        [self createWebView];
        [self createButton];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createWebView];
    [self createButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
