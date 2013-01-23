//
//  ViewController.m
//  weiChatDemo
//
//  Created by holyen on 13-1-23.
//  Copyright (c) 2013年 my.company. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _scene = WXSceneTimeline;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.segmentedControl.selectedSegmentIndex = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)sendTXT:(id)sender {
    if (_delegate) {
        [_delegate sendTXT:@"Test ~~~~Text..."];
    }
}

- (IBAction)sendPhoto:(id)sender {
}

- (IBAction)sendVideo:(id)sender {
    if (_delegate) {
        [_delegate sendVideo];
    }
}

- (IBAction)sendNews:(id)sender {
}

- (IBAction)segmentValueChanged:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            _scene = WXSceneSession;
            break;
        case 1:
            _scene = WXSceneTimeline;
            break;
        default:
            break;
    }
}

- (IBAction)openWXApp:(id)sender {
    [WXApi openWXApp];
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        NSString *strTitle = [NSString stringWithFormat:@"发送结果"];
        NSString *strMsg = [NSString stringWithFormat:@"发送媒体消息结果:%d", resp.errCode];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    else if([resp isKindOfClass:[SendAuthResp class]])
    {
        NSString *strTitle = [NSString stringWithFormat:@"Auth结果"];
        NSString *strMsg = [NSString stringWithFormat:@"Auth结果:%d", resp.errCode];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }

}
- (void)dealloc {
    [_segmentedControl release];
    [super dealloc];
}
@end
