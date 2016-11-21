//
//  CSPVideoViewController.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/20/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPVideoViewController.h"
#import <AVFoundation/AVPlayer.h>

@interface CSPVideoViewController ()
@property (nonatomic, strong) AVPlayer *videoPlayer;

//depricated :(
//@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@end

@implementation CSPVideoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self playvideo: self.chosenContent];
}

-(void)playvideo:(NSURL*)chosenContent
{
    
    self.videoPlayer = [AVPlayer playerWithURL: chosenContent];
    AVPlayerViewController *videoPlayerController = [[AVPlayerViewController alloc] init];
    [self addChildViewController: videoPlayerController];
    [self.view addSubview: videoPlayerController.view];
    
    videoPlayerController.view.frame = self.view.frame;
    videoPlayerController.player = self.videoPlayer;
    videoPlayerController.showsPlaybackControls = YES;
    [self.videoPlayer pause];
    [self.videoPlayer play];
    
    //depricated :(
//    self.moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:chosenContent];
//    
//    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(videoCompleted) name: videoCompletedNotification object: self.movieplayer];
    //[self presentationController moviePlayer];
}

//after video plays, set up notification so app aknowledges this, user then can hit the back button or replay video.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
