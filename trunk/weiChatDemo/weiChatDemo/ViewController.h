//
//  ViewController.h
//  weiChatDemo
//
//  Created by holyen on 13-1-23.
//  Copyright (c) 2013年 my.company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"

@protocol sendWXDelegate <NSObject>

- (void)sendTXT:(NSString *)textContent;
- (void)sendVideo;
- (void)doAuth;

@end

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic) enum WXScene scene;
@property (assign, nonatomic) id<sendWXDelegate> delegate;

- (IBAction)sendTXT:(id)sender;
- (IBAction)sendPhoto:(id)sender;
- (IBAction)sendVideo:(id)sender;
- (IBAction)sendNews:(id)sender;
- (IBAction)segmentValueChanged:(id)sender;
- (IBAction)openWXApp:(id)sender;

@end
