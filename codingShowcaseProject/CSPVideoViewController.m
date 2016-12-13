//
//  CSPVideoViewController.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/20/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPVideoViewController.h"
#import <AVFoundation/AVPlayer.h>

@interface CSPVideoViewController () <UIWebViewDelegate>
@property (nonatomic, strong) AVPlayer *videoPlayer;

@end

@implementation CSPVideoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"CHOSEN CONTENT--> %@", self.chosenContent);
    [self playvideo: self.chosenContent];
}

-(void)playvideo:(NSString*)chosenContent
{
     NSString *videoString = [NSString stringWithFormat: @"https://www.youtube.com/watch?v=%@", self.chosenContent.videoID];
    
    NSURL *vidURL = [[NSURL alloc] initWithString: videoString];
    NSLog(@"\n\n\nthe vid url:%@\n\n", vidURL);

    self.videoPlayer = [AVPlayer playerWithURL: vidURL];
    
    AVPlayerViewController *videoPlayerController = [[AVPlayerViewController alloc] init];
    videoPlayerController.player = self.videoPlayer;
    NSURLRequest *videoRequest = [NSURLRequest requestWithURL: vidURL];
    [self.webView loadRequest: videoRequest];

}

//after video plays, set up notification so app aknowledges this, user then can hit the back button or replay video.
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
