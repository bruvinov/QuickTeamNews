//
//  WebViewController.h
//  SportsTeams
//
//  Created by Boris Ruvinov on 3/14/16.
//  Copyright © 2016 Boris Ruvinov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UIButton *backButton;
@property (nonatomic, strong) NSString *url;

@end
