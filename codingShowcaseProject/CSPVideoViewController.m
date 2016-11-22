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

//depricated :(
//@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@end

@implementation CSPVideoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self playvideo: self.chosenContent];
    
    NSURL *vidURL = self.chosenContent;
   // NSURL *stringTest = [NSURL URLWithString: @"https://www.youtube.com/results?&part=snippet&q=current+events+Australia"];
     NSURLRequest *videoRequest = [NSURLRequest requestWithURL: self.chosenContent];

    [self.webView loadRequest: videoRequest];
   // [self.webView loadRequest: stringTest];

    
}

/*
-(void)playvideo:(NSURL*)chosenContent
{
    NSURL *vidURL = self.chosenContent;
   // self.videoPlayer = [AVPlayer playerWithURL: vidURL];
    
    AVPlayerViewController *videoPlayerController = [[AVPlayerViewController alloc] init];
    videoPlayerController.player = self.videoPlayer;
    NSURLRequest *videoRequest = [NSURLRequest requestWithURL: vidURL];
    [self.webView loadRequest: videoRequest];
    

   // [self.playButton sendActionsForControlEvents: UIControlEventTouchUpInside];
    [self presentViewController: videoPlayerController animated:YES completion:
     ^{

         NSLog(@"vid player");
        // [self.webView loadRequest: [NSURLRequest requestWithURL: vidURL]];
        // self.webView.scrollView.bounds= NO;
         [self.webView setMediaPlaybackRequiresUserAction: NO];
    }];

   // self.videoPlayer = [AVPlayer playerWithURL: chosenContent];
    //AVPlayerViewController *videoPlayerController = [[AVPlayerViewController alloc] init];
    //[self addChildViewController: videoPlayerController];
    //[self.view addSubview: videoPlayerController.view];
    
    //videoPlayerController.view.frame = self.view.frame;
    //videoPlayerController.player = self.videoPlayer;
    videoPlayerController.showsPlaybackControls = YES;
    [self.videoPlayer pause];
    [self.videoPlayer play];
    
    
    [self.playButton sendActionsForControlEvents: UIControlEventTouchUpInside];

    //depricated :(
//    self.moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:chosenContent];
//    
//    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(videoCompleted) name: videoCompletedNotification object: self.movieplayer];
    //[self presentationController moviePlayer];
}
 */

//after video plays, set up notification so app aknowledges this, user then can hit the back button or replay video.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
