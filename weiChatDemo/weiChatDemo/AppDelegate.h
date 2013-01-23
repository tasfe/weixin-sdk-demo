//
//  AppDelegate.h
//  weiChatDemo
//
//  Created by holyen on 13-1-23.
//  Copyright (c) 2013年 my.company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"
#import "ViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate,sendWXDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
